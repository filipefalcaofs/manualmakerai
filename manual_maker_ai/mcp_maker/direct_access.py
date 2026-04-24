"""Direct Access Engine — operacoes DML/DDL diretas no banco de metadados Maker.

Materializa formularios, componentes, regras e vinculos de eventos diretamente
nas tabelas de framework (FR_*), eliminando a necessidade de importar FRZ.

Schema de metadados mapeado:
- FR_FORMULARIO: formularios (PK: FRM_CODIGO)
- FR_COMPONENTE: componentes visuais (PK: FRM_CODIGO + COM_CODIGO)
- FR_PROPRIEDADE: properties de componentes (PK: FRM_CODIGO + COM_CODIGO + PRO_NOME)
- FR_FONTEDADOS: fontes de dados/SQL (PK: FNT_CODIGO)
- FR_REGRAS: regras de negocio/fluxogramas (PK: REG_COD)
- FR_ACAOCOMPONENTE: vinculos evento-acao (PK: FRM_CODIGO + COM_CODIGO + ACO_CODIGO + ACC_MOMENTO)
- FR_PARAMETRO: parametros de eventos (PK: FRM_CODIGO + COM_CODIGO + ACO_CODIGO + ACC_MOMENTO + PAR_NOME)
- FR_TABELA: dicionario de tabelas (PK: TAB_NOME)
- FR_MENU: estrutura de menus (PK: SIS_CODIGO + MNU_CODIGO)
- FR_CATEGORIA: categorias de regras (PK: CAT_CODIGO)

Ranges reais: FRM_CODIGO ate 464M, COM_CODIGO ate 1M, REG_COD ate 2516, FNT ate 1056.
Ranges seguros para insercao: FRM >= 900000000, COM >= 9000000, REG >= 90000, FNT >= 90000.

Drivers suportados: mysql (pymysql), mssql (pymssql), postgresql (psycopg2), oracle (cx_Oracle).

Inferido de: 876 formularios, 10936 componentes, 2445 regras, 1879 vinculos de producao.
"""

from __future__ import annotations

import base64
import uuid
from dataclasses import dataclass, field
from typing import Any


# ---------------------------------------------------------------------------
# DatabaseConnection — abstrai o driver de banco
# ---------------------------------------------------------------------------

class DatabaseConnection:
    """Interface unificada para conexao com qualquer banco suportado."""

    COALESCE = {"mysql": "IFNULL", "mssql": "ISNULL", "postgresql": "COALESCE", "oracle": "NVL"}
    AUTO_INCREMENT = {
        "mysql": "AUTO_INCREMENT",
        "mssql": "IDENTITY(1,1)",
        "postgresql": "GENERATED ALWAYS AS IDENTITY",
        "oracle": "GENERATED ALWAYS AS IDENTITY",
    }
    PARAM_STYLE = {"mysql": "%s", "mssql": "%s", "postgresql": "%s", "oracle": ":p{i}"}

    def __init__(self, host: str, port: int, user: str, password: str, database: str, driver: str = "mssql"):
        self.driver = driver.lower()
        if self.driver not in ("mysql", "mssql", "postgresql", "oracle"):
            raise ValueError(f"Driver '{driver}' nao suportado. Use: mysql, mssql, postgresql, oracle")

        if self.driver == "mysql":
            import pymysql
            self.conn = pymysql.connect(
                host=host, port=port, user=user, password=password,
                database=database, charset="utf8mb4", autocommit=False,
            )
        elif self.driver == "mssql":
            import pymssql
            self.conn = pymssql.connect(
                server=host, port=port, user=user, password=password, database=database,
            )
        elif self.driver == "postgresql":
            import psycopg2
            self.conn = psycopg2.connect(
                host=host, port=port, user=user, password=password, dbname=database,
            )
        elif self.driver == "oracle":
            import cx_Oracle
            dsn = cx_Oracle.makedsn(host, port, service_name=database)
            self.conn = cx_Oracle.connect(user=user, password=password, dsn=dsn)

        self.cur = self.conn.cursor()

    def execute(self, sql: str, params: tuple | None = None) -> None:
        if self.driver == "oracle" and params:
            sql_adapted = sql
            for i in range(len(params)):
                sql_adapted = sql_adapted.replace("%s", f":p{i}", 1)
            self.cur.execute(sql_adapted, params)
        else:
            self.cur.execute(sql, params)

    def fetchone(self):
        return self.cur.fetchone()

    def fetchall(self):
        return self.cur.fetchall()

    def commit(self):
        self.conn.commit()

    def rollback(self):
        self.conn.rollback()

    def close(self):
        self.conn.close()

    def coalesce_fn(self) -> str:
        return self.COALESCE[self.driver]

    def auto_increment_syntax(self) -> str:
        return self.AUTO_INCREMENT[self.driver]

    def quote_name(self, name: str) -> str:
        if self.driver == "mysql":
            return f"`{name}`"
        elif self.driver in ("mssql",):
            return f"[{name}]"
        elif self.driver == "oracle":
            return f'"{name}"'
        return f'"{name}"'

    def table_exists_sql(self) -> str:
        if self.driver == "mysql":
            return "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = %s"
        elif self.driver == "postgresql":
            return "SELECT COUNT(*) FROM information_schema.tables WHERE table_name = %s"
        elif self.driver == "oracle":
            return "SELECT COUNT(*) FROM user_tables WHERE table_name = UPPER(%s)"
        return "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = %s"

# ACO_CODIGO fixos — os 12 tipos de acao do Maker
ACO_EXECUTAR_REGRA = 12
ACO_ABRIR_JANELA = 1
ACO_STORED_PROC = 2
ACO_HABILITAR_DESABILITAR = 3
ACO_MOSTRAR_OCULTAR = 4
ACO_ESCOLHER_FOCO = 5
ACO_MUDAR_COR = 6
ACO_MUDAR_VALOR = 7
ACO_ABRIR_RELATORIO = 8

# IMG_* defaults para toolbar (extraidos de formulario real cod=2)
_IMG_DEFAULTS = {
    "IMG_INCLUIR": 1, "IMG_ALTERAR": 2, "IMG_EXCLUIR": 8,
    "IMG_GRAVAR": 12, "IMG_CANCELAR": 13, "IMG_ATUALIZAR": 7,
    "IMG_UTILITARIO": 1, "IMG_SAIR": 11, "IMG_IMPRIMIR": 10,
    "IMG_AJUDA": 14, "IMG_PROXIMO": 5, "IMG_ULTIMO": 6,
    "IMG_PRIMEIRO": 3, "IMG_ANTERIOR": 4,
}


def _new_guid() -> str:
    return "{" + str(uuid.uuid4()).upper() + "}"


# ---------------------------------------------------------------------------
# Dataclasses para especificacao
# ---------------------------------------------------------------------------

@dataclass
class PropertySpec:
    nome: str
    valor: str


@dataclass
class ComponentSpec:
    nome: str
    tipo: str
    campo: str = ""
    descricao: str = ""
    aba: str = "01-Cadastro"
    container: str = ""
    properties: list[PropertySpec] = field(default_factory=list)


@dataclass
class EventBindingSpec:
    componente_nome: str
    evento: str
    regra_nome: str
    entrada: str = ""


@dataclass
class FonteDadosSpec:
    tabela: str
    campo_chave: str
    sql_select: str
    sql_update: str = ""
    campos_grade: str = ""
    campos_pesquisa: str = ""
    sql_default: str = ""
    sql_mascara: str = ""


@dataclass
class MenuItemSpec:
    descricao: str
    sistema: str = "SIG"
    parent_codigo: int = 0
    indice: int = 0


# ---------------------------------------------------------------------------
# Motor de acesso direto
# ---------------------------------------------------------------------------

class DirectAccessEngine:
    """Executa operacoes DML/DDL diretamente no banco de metadados Maker.

    Todas as operacoes sao transacionais — commit apenas no final.
    Suporta MySQL/MariaDB, SQL Server, PostgreSQL e Oracle.
    """

    def __init__(self, host: str, port: int, user: str, password: str, database: str, driver: str = "mssql"):
        self.db = DatabaseConnection(host, port, user, password, database, driver)
        self.cur = self.db.cur
        self.conn = self.db.conn
        self._driver = driver.lower()
        self._log: list[str] = []
        self._log_op(f"[CONN] Conectado via {driver} em {host}:{port}/{database}")

    def close(self) -> None:
        self.db.close()

    def _log_op(self, msg: str) -> None:
        self._log.append(msg)

    def get_log(self) -> list[str]:
        return list(self._log)

    # --- ID generators (multi-driver) ---

    def _coalesce(self, expr: str, default: int) -> str:
        fn = self.db.coalesce_fn()
        return f"{fn}({expr}, {default})"

    def _next_form_id(self) -> int:
        sql = f"SELECT {self._coalesce('MAX(FRM_CODIGO)', 900000000)} + 1 FROM FR_FORMULARIO WHERE FRM_CODIGO >= 900000000"
        self.cur.execute(sql)
        return max(self.cur.fetchone()[0], 900000001)

    def _next_component_id(self, frm_codigo: int) -> int:
        sql = f"SELECT {self._coalesce('MAX(COM_CODIGO)', 9000000)} + 1 FROM FR_COMPONENTE WHERE FRM_CODIGO = %s"
        self.cur.execute(sql, (frm_codigo,))
        return max(self.cur.fetchone()[0], 9000001)

    def _next_rule_id(self) -> int:
        sql = f"SELECT {self._coalesce('MAX(REG_COD)', 90000)} + 1 FROM FR_REGRAS WHERE REG_COD >= 90000"
        self.cur.execute(sql)
        return max(self.cur.fetchone()[0], 90001)

    def _next_fnt_id(self) -> int:
        sql = f"SELECT {self._coalesce('MAX(FNT_CODIGO)', 90000)} + 1 FROM FR_FONTEDADOS WHERE FNT_CODIGO >= 90000"
        self.cur.execute(sql)
        return max(self.cur.fetchone()[0], 90001)

    def _next_menu_id(self, sis_codigo: str) -> int:
        sql = f"SELECT {self._coalesce('MAX(MNU_CODIGO)', 9000)} + 1 FROM FR_MENU WHERE SIS_CODIGO = %s AND MNU_CODIGO >= 9000"
        self.cur.execute(sql, (sis_codigo,))
        return max(self.cur.fetchone()[0], 9001)

    # --- Verificacao de conflitos ---

    def _check_guid_conflict(self, guid: str) -> bool:
        self.cur.execute("SELECT COUNT(*) FROM FR_FORMULARIO WHERE FRM_GUID = %s", (guid,))
        return self.cur.fetchone()[0] > 0

    def _check_rule_name_conflict(self, nome: str) -> bool:
        self.cur.execute("SELECT COUNT(*) FROM FR_REGRAS WHERE REG_NOME = %s", (nome,))
        return self.cur.fetchone()[0] > 0

    def _check_table_exists(self, tabela: str) -> bool:
        sql = self.db.table_exists_sql()
        self.cur.execute(sql, (tabela,))
        return self.cur.fetchone()[0] > 0

    # --- DDL: Criar tabelas de negocio ---

    def create_business_table(
        self,
        tabela: str,
        colunas: list[dict],
        descricao: str = "",
    ) -> dict:
        """Cria tabela de negocio + registra no dicionario de dados (FR_TABELA).

        colunas: [{"nome": "COL", "tipo": "varchar(100)", "nullable": True, "pk": False}]
        Retorna: {"tabela": nome, "criada": bool}
        """
        if self._check_table_exists(tabela):
            self._log_op(f"[DDL] Tabela {tabela} ja existe — skip")
            return {"tabela": tabela, "criada": False}

        pk_cols = [c["nome"] for c in colunas if c.get("pk")]

        q = self.db.quote_name
        auto_inc = self.db.auto_increment_syntax()

        col_defs = []
        for c in colunas:
            null_str = "NULL" if c.get("nullable", True) else "NOT NULL"
            identity = f" {auto_inc}" if c.get("identity") else ""
            col_defs.append(f"  {q(c['nome'])} {c['tipo']}{identity} {null_str}")

        if pk_cols:
            col_defs.append(f"  CONSTRAINT PK_{tabela} PRIMARY KEY ({', '.join(q(c) for c in pk_cols)})")

        ddl = f"CREATE TABLE {q(tabela)} (\n{',\n'.join(col_defs)}\n)"
        self.cur.execute(ddl)
        self._log_op(f"[DDL] Tabela {tabela} criada ({len(colunas)} colunas)")

        self.cur.execute(
            "INSERT INTO FR_TABELA (TAB_NOME, TAB_DESCRICAO) VALUES (%s, %s)",
            (tabela, descricao or tabela)
        )
        self._log_op(f"[DML] FR_TABELA: registrado {tabela}")

        return {"tabela": tabela, "criada": True}

    # --- DML: Criar formulario ---

    def create_form(
        self,
        descricao: str,
        tamanho: int = 1100,
        altura: int = 700,
        guid: str = "",
    ) -> int:
        """Insere formulario em FR_FORMULARIO. Retorna FRM_CODIGO."""
        frm_codigo = self._next_form_id()
        guid = guid or _new_guid()

        while self._check_guid_conflict(guid):
            guid = _new_guid()

        cols = ["FRM_CODIGO", "FRM_DESCRICAO", "FRM_TAMANHO", "FRM_ALTURA",
                "FRM_GUID", "FRM_TIPO_CRIACAO", "FRM_LOG"]
        vals = [frm_codigo, descricao, tamanho, altura, guid, "0", "S"]

        for img_col, img_val in _IMG_DEFAULTS.items():
            cols.append(img_col)
            vals.append(img_val)

        placeholders = ", ".join(["%s"] * len(cols))
        col_str = ", ".join(cols)
        self.cur.execute(f"INSERT INTO FR_FORMULARIO ({col_str}) VALUES ({placeholders})", tuple(vals))
        self._log_op(f"[DML] FR_FORMULARIO: {descricao} (cod={frm_codigo}, guid={guid[:20]}...)")

        return frm_codigo

    # --- DML: Criar componentes ---

    def create_component(
        self,
        frm_codigo: int,
        tipo: str,
        properties: dict[str, str],
        com_codigo: int = 0,
    ) -> int:
        """Insere componente em FR_COMPONENTE + FR_PROPRIEDADE. Retorna COM_CODIGO."""
        if com_codigo == 0:
            com_codigo = self._next_component_id(frm_codigo)

        self.cur.execute(
            "INSERT INTO FR_COMPONENTE (FRM_CODIGO, COM_CODIGO, COM_TIPO) VALUES (%s, %s, %s)",
            (frm_codigo, com_codigo, tipo)
        )

        for prop_nome, prop_valor in properties.items():
            if prop_valor is None:
                continue
            self.cur.execute(
                "INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR) "
                "VALUES (%s, %s, %s, %s)",
                (frm_codigo, com_codigo, prop_nome, str(prop_valor))
            )

        self._log_op(f"[DML] FR_COMPONENTE: tipo={tipo} cod={com_codigo} ({len(properties)} props)")
        return com_codigo

    def create_form_component(
        self,
        frm_codigo: int,
        descricao: str,
        tabela: str = "",
        campo_chave: str = "",
        navegacao: bool = True,
        abas: bool = True,
        responsivo: bool = True,
        css: str = "",
    ) -> int:
        """Cria o componente tipo F (form shell) — o container raiz do formulario."""
        guid = _new_guid()
        props = {
            "Descricao": descricao,
            "Nome": f"frm{descricao.replace(' ', '')}",
            "GUID": guid,
            "Navegacao": "TRUE" if navegacao else "FALSE",
            "Abas": "TRUE" if abas else "FALSE",
            "Responsivo": "TRUE" if responsivo else "FALSE",
            "BarraDeRolagem": "True",
            "AbaLocalizar": "TRUE" if tabela else "FALSE",
            "EditarAoDuploClicar": "TRUE" if tabela else "FALSE",
            "BotaoFechar": "True",
            "BotaoMaximizar": "False",
            "BotaoMinimizar": "True",
            "Modal": "False",
            "Centralizado": "False",
            "CentralizadoVertical": "False",
            "Cor": "clBtnFace",
            "EntrarComoPesquisa": "FALSE",
            "FonteDeDados": "(Conexão principal)",
        }
        if css:
            props["ClasseCss"] = css

        return self.create_component(frm_codigo, "F", props)

    def create_field_component(
        self,
        frm_codigo: int,
        nome: str,
        tipo: str,
        campo: str = "",
        descricao: str = "",
        aba: str = "01-Cadastro",
        container: str = "",
        css_class: str = "",
        extra_props: dict[str, str] | None = None,
    ) -> int:
        """Cria componente de campo (E, C, K, M, H, R, etc.)."""
        props: dict[str, str] = {
            "Nome": nome,
            "GUID": _new_guid(),
            "Aba": aba,
        }
        if campo:
            props["Campo"] = campo
        if descricao:
            props["Descricao"] = descricao
        if container:
            props["Container"] = container
        if css_class:
            props["NomeClasseCss"] = css_class

        if extra_props:
            props.update(extra_props)

        return self.create_component(frm_codigo, tipo, props)

    # --- DML: Fonte de dados ---

    def create_datasource(
        self,
        frm_codigo: int,
        spec: FonteDadosSpec,
    ) -> int:
        """Insere fonte de dados em FR_FONTEDADOS. Retorna FNT_CODIGO."""
        fnt_codigo = self._next_fnt_id()

        self.cur.execute(
            "INSERT INTO FR_FONTEDADOS (FNT_CODIGO, FRM_CODIGO, FNT_TABELA, FNT_CAMPOCHAVE, "
            "FNT_SQLSELECT, FNT_SQLUPDATE, FNT_CAMPOGRADE, FNT_CAMPOPESQUISA, "
            "FNT_SQLDEFAULT, FNT_SQLMASCARA) "
            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (fnt_codigo, frm_codigo, spec.tabela, spec.campo_chave,
             spec.sql_select, spec.sql_update or None, spec.campos_grade or None,
             spec.campos_pesquisa or None, spec.sql_default or None, spec.sql_mascara or None)
        )
        self._log_op(f"[DML] FR_FONTEDADOS: {spec.tabela} (fnt={fnt_codigo})")
        return fnt_codigo

    # --- DML: Regras (fluxogramas) ---

    def create_rule(
        self,
        nome: str,
        destino: int,
        reg_interface_b64: str,
        reg_script_b64: str,
        params: str = "",
        variaveis: str = "",
        params_out: str = "",
        descricao: str = "",
        categoria: int = 1,
    ) -> int:
        """Insere regra em FR_REGRAS. Retorna REG_COD.

        reg_interface_b64: DFM codificado em base64
        reg_script_b64: Script XML codificado em base64
        """
        if self._check_rule_name_conflict(nome):
            self._log_op(f"[AVISO] Regra '{nome}' ja existe — gerando nome unico")
            nome = f"{nome} ({uuid.uuid4().hex[:6]})"

        reg_cod = self._next_rule_id()

        self.cur.execute(
            "INSERT INTO FR_REGRAS (REG_COD, REG_NOME, REG_DESCRICAO, REG_PARAMS, "
            "REG_VARIAVEIS, REG_PARAMS_OUT, REG_INTERFACE, REG_SCRIPT, "
            "REG_DESTINO, REG_COMPILADA, CAT_COD) "
            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
            (reg_cod, nome, descricao or nome, params, variaveis,
             params_out or None, reg_interface_b64, reg_script_b64,
             destino, "N", categoria)
        )
        self._log_op(f"[DML] FR_REGRAS: {nome} (cod={reg_cod}, destino={destino})")
        return reg_cod

    def create_rule_from_spec(self, rule_spec: dict) -> int:
        """Cria regra a partir da spec JSON (mesmo formato de gerar_fluxo).

        Converte spec para DFM + Script XML via builder, depois insere.
        """
        from .builder import RuleBuilder, RuleSpec, RuleParam, RuleVar
        from .server import _parse_steps

        rs = RuleSpec(
            nome=rule_spec["nome"],
            destino=rule_spec.get("destino", 2),
            codigo=rule_spec.get("codigo", 0),
            descricao=rule_spec.get("descricao", rule_spec["nome"]),
            retorno_tipo=rule_spec.get("retorno_tipo", ""),
            categoria=rule_spec.get("categoria", r"\Uso Geral"),
            parametros=[
                RuleParam(nome=p["nome"], tipo=p["tipo"], tamanho=p.get("tamanho", ""))
                for p in rule_spec.get("parametros", [])
            ],
            variaveis=[
                RuleVar(nome=v["nome"], tipo=v["tipo"], tamanho=v.get("tamanho", ""))
                for v in rule_spec.get("variaveis", [])
            ],
            passos=_parse_steps(rule_spec.get("passos", [])),
        )

        rb = RuleBuilder(rs)
        dfm, script, _ = rb.build()

        params_str = ";".join(
            f"{p['nome']},{p['tipo']},{p.get('tamanho', '')},"
            for p in rule_spec.get("parametros", [])
        )
        vars_str = ";".join(
            f"{v['nome']},{v['tipo']},{v.get('tamanho', '')},"
            for v in rule_spec.get("variaveis", [])
        )

        return self.create_rule(
            nome=rs.nome,
            destino=rs.destino,
            reg_interface_b64=dfm,
            reg_script_b64=script,
            params=params_str,
            variaveis=vars_str,
            params_out=rule_spec.get("retorno_tipo", ""),
            descricao=rs.descricao,
            categoria=1,
        )

    # --- DML: Vincular eventos ---

    def bind_event(
        self,
        frm_codigo: int,
        com_codigo: int,
        evento: str,
        regra_nome: str,
        entrada: str = "",
    ) -> None:
        """Vincula uma regra a um evento de componente.

        Insere em FR_ACAOCOMPONENTE + FR_PARAMETRO.
        ACO_CODIGO=12 (Executar Regra de negocio).
        """
        self.cur.execute(
            "SELECT COUNT(*) FROM FR_ACAOCOMPONENTE "
            "WHERE FRM_CODIGO = %s AND COM_CODIGO = %s AND ACO_CODIGO = %s AND ACC_MOMENTO = %s",
            (frm_codigo, com_codigo, ACO_EXECUTAR_REGRA, evento)
        )
        if self.cur.fetchone()[0] > 0:
            self._log_op(f"[AVISO] Binding {evento} em COM={com_codigo} ja existe — skip")
            return

        self.cur.execute(
            "INSERT INTO FR_ACAOCOMPONENTE (FRM_CODIGO, COM_CODIGO, ACO_CODIGO, ACC_MOMENTO) "
            "VALUES (%s, %s, %s, %s)",
            (frm_codigo, com_codigo, ACO_EXECUTAR_REGRA, evento)
        )

        self.cur.execute(
            "INSERT INTO FR_PARAMETRO (FRM_CODIGO, COM_CODIGO, ACO_CODIGO, ACC_MOMENTO, "
            "PAR_NOME, PAR_VALOR) VALUES (%s, %s, %s, %s, %s, %s)",
            (frm_codigo, com_codigo, ACO_EXECUTAR_REGRA, evento, "Nome", regra_nome)
        )

        self.cur.execute(
            "INSERT INTO FR_PARAMETRO (FRM_CODIGO, COM_CODIGO, ACO_CODIGO, ACC_MOMENTO, "
            "PAR_NOME, PAR_VALOR) VALUES (%s, %s, %s, %s, %s, %s)",
            (frm_codigo, com_codigo, ACO_EXECUTAR_REGRA, evento, "Entrada", entrada or "")
        )

        self._log_op(f"[DML] BIND: {evento} -> '{regra_nome}' (com={com_codigo})")

    # --- DML: Menu ---

    def create_menu_item(
        self,
        descricao: str,
        frm_codigo: int,
        sistema: str = "SIG",
        parent_codigo: int = 0,
        indice: int = 0,
    ) -> int:
        """Insere item de menu em FR_MENU. Retorna MNU_CODIGO."""
        mnu_codigo = self._next_menu_id(sistema)

        self.cur.execute(
            "INSERT INTO FR_MENU (SIS_CODIGO, MNU_CODIGO, MNU_DESCRICAO, MNU_CODIGO_PARENT, "
            "MNU_INDICE, FRM_CODIGO, MNU_GUID, MNU_TIPO) "
            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s)",
            (sistema, mnu_codigo, descricao, parent_codigo or None,
             indice, frm_codigo, _new_guid(), "F")
        )
        self._log_op(f"[DML] FR_MENU: {descricao} (mnu={mnu_codigo}, sis={sistema})")
        return mnu_codigo

    # --- Transacao ---

    def commit(self) -> None:
        self.db.commit()
        self._log_op("[TX] COMMIT")

    def rollback(self) -> None:
        self.db.rollback()
        self._log_op("[TX] ROLLBACK")

    # --- Operacoes compostas de alto nivel ---

    def materialize_crud(
        self,
        tabela: str,
        descricao: str,
        campos: list[dict],
        regras: list[dict] | None = None,
        css: str = "",
        sistema: str = "SIG",
        criar_tabela: bool = False,
        colunas_ddl: list[dict] | None = None,
        campos_unicos: list[str] | None = None,
        dep_tabela_filha: str = "",
        dep_campo_fk: str = "",
        seed_data: bool = False,
        enterprise: bool = True,
    ) -> dict:
        """Materializa um CRUD completo no banco com UI premium e regras complexas:
        1. (Opcional) Cria tabela de negocio
        2. Enriquece spec com layout engine (cards, headers, posicionamento)
        3. Cria formulario com todas as posicoes calculadas
        4. Gera regras complexas (duplicidade, dependencia, condicionais, mascaras)
        5. Vincula regras aos eventos corretos por operacao
        6. (Opcional) Insere dados de exemplo
        7. Cria item de menu

        Retorna dict com IDs gerados.
        """
        from .enterprise import (
            enrich_crud_spec, generate_all_crud_rules, build_seed_data_sql,
        )

        result: dict[str, Any] = {"tabela": tabela}

        # 1. DDL
        if criar_tabela and colunas_ddl:
            tb = self.create_business_table(tabela, colunas_ddl, descricao)
            result["tabela_criada"] = tb["criada"]

        # 2. Enriquecer spec com enterprise UI
        campo_chave = next((c["campo"] for c in campos if c.get("pk")), "")
        if not campo_chave and campos:
            campo_chave = campos[0].get("campo", "")

        if enterprise:
            crud_spec = {
                "tabela": tabela,
                "titulo": descricao,
                "campos": campos,
                "css": css,
            }
            crud_spec = enrich_crud_spec(crud_spec)
            enriched_campos = crud_spec.get("campos", campos)
            form_css = crud_spec.get("css", css)
            form_altura = crud_spec.get("altura", 700)
        else:
            enriched_campos = campos
            form_css = css
            form_altura = 700

        # 3. Criar formulario
        frm_codigo = self.create_form(descricao, altura=form_altura)
        result["frm_codigo"] = frm_codigo

        has_tabela = bool(tabela)
        form_com = self.create_form_component(
            frm_codigo, descricao,
            tabela=tabela if has_tabela else "",
            campo_chave=campo_chave,
            navegacao=has_tabela,
            abas=has_tabela,
            css=form_css,
        )
        result["form_component"] = form_com

        # 4. Criar componentes com posicoes do layout engine
        com_map: dict[str, int] = {}
        for c in enriched_campos:
            nome = c.get("nome", f"edt{c.get('campo', 'Campo')}")
            tipo = c.get("tipo", "E")
            campo = c.get("campo", "")
            desc = c.get("descricao", nome)
            aba = c.get("aba", "01-Cadastro")
            container = c.get("container", "")

            props = c.get("properties", {})
            css_class = props.pop("NomeClasseCss", c.get("css_class", "form-group col-md-6"))

            extra: dict[str, str] = {}
            if c.get("obrigatorio") or props.get("Obrigatorio"):
                extra["Obrigatorio"] = "TRUE"
            if c.get("mascara") or props.get("Mascara"):
                extra["Mascara"] = c.get("mascara") or props.get("Mascara", "")
            if c.get("placeholder") or props.get("Placeholder"):
                extra["Placeholder"] = c.get("placeholder") or props.get("Placeholder", "")
            if c.get("somente_leitura") or props.get("ApenasLeitura"):
                extra["ApenasLeitura"] = "True"

            if c.get("posicao_x") is not None:
                extra["PosicaoX"] = str(c["posicao_x"])
            if c.get("posicao_y") is not None:
                extra["PosicaoY"] = str(c["posicao_y"])
            if c.get("tamanho") is not None:
                extra["Tamanho"] = str(c["tamanho"])
            if c.get("altura") is not None:
                extra["Altura"] = str(c["altura"])

            for k, v in props.items():
                if k not in extra and v is not None:
                    extra[k] = str(v) if not isinstance(v, str) else v

            com_id = self.create_field_component(
                frm_codigo, nome, tipo,
                campo=campo, descricao=desc,
                aba=aba, container=container,
                css_class=css_class, extra_props=extra,
            )
            com_map[nome] = com_id

        result["componentes"] = com_map

        # 5. Fonte de dados
        if has_tabela:
            data_campos = [c for c in campos if c.get("campo")]
            select_cols = ", ".join(f"{tabela}.{c['campo']}" for c in data_campos)
            sql_select = f"Select\n  {select_cols}\nFrom\n  {tabela}\n/*WHERE_NEW*/\n/*ORDER_NEW*/"
            update_cols = "\n".join(c["campo"] for c in data_campos if not c.get("pk"))
            grade_cols = ";".join(c["campo"] for c in data_campos[:6])
            pesq_cols = ";".join(c["campo"] for c in data_campos[:4])

            fnt_id = self.create_datasource(frm_codigo, FonteDadosSpec(
                tabela=tabela,
                campo_chave=campo_chave,
                sql_select=sql_select,
                sql_update=update_cols,
                campos_grade=grade_cols,
                campos_pesquisa=pesq_cols,
            ))
            result["fnt_codigo"] = fnt_id

        # 6. Gerar regras complexas
        all_rules = generate_all_crud_rules(
            tabela=tabela,
            campos=campos,
            campo_pk=campo_chave,
            campos_unicos=campos_unicos,
            dep_tabela_filha=dep_tabela_filha,
            dep_campo_fk=dep_campo_fk,
            nome_tela=descricao.replace("Cadastro de ", "").replace("Cadastro ", ""),
        )

        rule_ids: list[int] = []

        for r in all_rules["regras_srv"]:
            rid = self.create_rule_from_spec(r)
            rule_ids.append(rid)

        for r in all_rules["regras_cli"]:
            rid = self.create_rule_from_spec(r)
            rule_ids.append(rid)

        if all_rules["regra_mascaras"]:
            rid = self.create_rule_from_spec(all_rules["regra_mascaras"])
            rule_ids.append(rid)

        for r in all_rules["regras_condicionais"]:
            rid = self.create_rule_from_spec(r)
            rule_ids.append(rid)

        if regras:
            for r in regras:
                rid = self.create_rule_from_spec(r)
                rule_ids.append(rid)

        result["regras"] = rule_ids

        # 7. Vincular eventos automaticamente
        for v in all_rules["vinculos"]:
            evento = v["evento"]
            regra = v["regra_nome"]
            entrada = v.get("entrada", "")
            comp_nome = v.get("componente_nome", "")

            if comp_nome and comp_nome in com_map:
                target_com = com_map[comp_nome]
            else:
                target_com = form_com

            self.bind_event(frm_codigo, target_com, evento, regra, entrada)

        # 8. Seed data
        if seed_data and has_tabela:
            stmts = build_seed_data_sql(tabela, campos)
            for stmt in stmts:
                try:
                    self.cur.execute(stmt)
                    self._log_op(f"[SEED] {stmt[:60]}...")
                except Exception as e:
                    self._log_op(f"[SEED-WARN] {e}")

        # 9. Menu
        mnu = self.create_menu_item(descricao, frm_codigo, sistema=sistema)
        result["menu"] = mnu

        self._log_op(
            f"[CRUD] {descricao}: {len(com_map)} componentes, "
            f"{len(rule_ids)} regras, {len(all_rules['vinculos'])} vinculos"
        )

        return result

    def materialize_system(
        self,
        nome_sistema: str,
        modulos: list[dict],
        sistema: str = "SIG",
        css: str = "",
        seed_data: bool = False,
        enterprise: bool = True,
    ) -> dict:
        """Materializa um sistema completo com UI premium e regras complexas.

        modulos: [{"tipo": "crud", "tabela": ..., "campos": [...], ...}]
        Cada modulo pode ter: campos_unicos, dep_tabela_filha, dep_campo_fk, seed_data.
        """
        results: dict[str, Any] = {"sistema": nome_sistema, "modulos": []}

        for mod in modulos:
            tipo = mod.get("tipo", "crud")

            if tipo == "crud":
                r = self.materialize_crud(
                    tabela=mod["tabela"],
                    descricao=mod.get("descricao", mod["tabela"]),
                    campos=mod.get("campos", []),
                    regras=mod.get("regras"),
                    css=css,
                    sistema=sistema,
                    criar_tabela=mod.get("criar_tabela", False),
                    colunas_ddl=mod.get("colunas_ddl"),
                    campos_unicos=mod.get("campos_unicos"),
                    dep_tabela_filha=mod.get("dep_tabela_filha", ""),
                    dep_campo_fk=mod.get("dep_campo_fk", ""),
                    seed_data=mod.get("seed_data", seed_data),
                    enterprise=enterprise,
                )
                results["modulos"].append({"tipo": "crud", **r})

        return results

    def verify_integrity(self, frm_codigo: int) -> list[str]:
        """Verifica integridade de um formulario materializado."""
        issues: list[str] = []

        self.cur.execute(
            "SELECT COUNT(*) FROM FR_FORMULARIO WHERE FRM_CODIGO = %s", (frm_codigo,)
        )
        if self.cur.fetchone()[0] == 0:
            issues.append(f"FR_FORMULARIO: FRM_CODIGO={frm_codigo} nao existe")
            return issues

        self.cur.execute(
            "SELECT COUNT(*) FROM FR_COMPONENTE WHERE FRM_CODIGO = %s", (frm_codigo,)
        )
        comp_count = self.cur.fetchone()[0]
        if comp_count == 0:
            issues.append(f"FR_COMPONENTE: nenhum componente para FRM={frm_codigo}")

        self.cur.execute(
            "SELECT COUNT(*) FROM FR_COMPONENTE WHERE FRM_CODIGO = %s AND COM_TIPO = 'F'",
            (frm_codigo,)
        )
        if self.cur.fetchone()[0] == 0:
            issues.append(f"FR_COMPONENTE: sem componente tipo F (form shell)")

        self.cur.execute(
            "SELECT COM_CODIGO FROM FR_COMPONENTE WHERE FRM_CODIGO = %s", (frm_codigo,)
        )
        com_ids = [r[0] for r in self.cur.fetchall()]

        for com_id in com_ids:
            self.cur.execute(
                "SELECT COUNT(*) FROM FR_PROPRIEDADE WHERE FRM_CODIGO = %s AND COM_CODIGO = %s",
                (frm_codigo, com_id)
            )
            if self.cur.fetchone()[0] == 0:
                issues.append(f"FR_PROPRIEDADE: sem props para COM={com_id}")

        self.cur.execute(
            "SELECT COUNT(*) FROM FR_FONTEDADOS WHERE FRM_CODIGO = %s", (frm_codigo,)
        )
        fnt_count = self.cur.fetchone()[0]
        if fnt_count == 0:
            self._log_op(f"[INFO] Sem fonte de dados (template)")

        if not issues:
            issues.append("OK — integridade verificada")

        return issues
