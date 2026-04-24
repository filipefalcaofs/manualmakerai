-- ============================================================================
-- FIX POSICIONAMENTO — Cadastro de Edital (Form 2000)
-- ============================================================================
-- Executar no DBeaver (Alt+X) conectado ao banco fmt (MariaDB)
-- 
-- Este script corrige:
--   1. PosicaoX / PosicaoY de cada componente
--   2. NomeClasseCss (Bootstrap col-md-N)
--   3. Container (aninhamento correto)
--   4. Ordem de renderizacao
--   5. Descricao dos labels de header (HTML com icones)
--
-- PASSO 1: Execute a query diagnostica abaixo para validar o estado atual
-- PASSO 2: Execute os UPDATEs de correcao
-- ============================================================================

-- ============================================================================
-- DIAGNOSTICO: Verificar estado atual dos componentes
-- ============================================================================
SELECT 
    c.COM_CODIGO,
    c.COM_TIPO,
    pNome.PRO_VALOR AS Nome,
    pCampo.PRO_VALOR AS Campo,
    pAba.PRO_VALOR AS Aba,
    pPX.PRO_VALOR AS PosicaoX,
    pPY.PRO_VALOR AS PosicaoY,
    pCont.PRO_VALOR AS Container,
    pCSS.PRO_VALOR AS NomeClasseCss,
    pOrdem.PRO_VALOR AS Ordem
FROM FR_COMPONENTE c
LEFT JOIN FR_PROPRIEDADE pNome  ON pNome.FRM_CODIGO=c.FRM_CODIGO AND pNome.COM_CODIGO=c.COM_CODIGO AND pNome.PRO_NOME='Nome'
LEFT JOIN FR_PROPRIEDADE pCampo ON pCampo.FRM_CODIGO=c.FRM_CODIGO AND pCampo.COM_CODIGO=c.COM_CODIGO AND pCampo.PRO_NOME='Campo'
LEFT JOIN FR_PROPRIEDADE pAba   ON pAba.FRM_CODIGO=c.FRM_CODIGO AND pAba.COM_CODIGO=c.COM_CODIGO AND pAba.PRO_NOME='Aba'
LEFT JOIN FR_PROPRIEDADE pPX    ON pPX.FRM_CODIGO=c.FRM_CODIGO AND pPX.COM_CODIGO=c.COM_CODIGO AND pPX.PRO_NOME='PosicaoX'
LEFT JOIN FR_PROPRIEDADE pPY    ON pPY.FRM_CODIGO=c.FRM_CODIGO AND pPY.COM_CODIGO=c.COM_CODIGO AND pPY.PRO_NOME='PosicaoY'
LEFT JOIN FR_PROPRIEDADE pCont  ON pCont.FRM_CODIGO=c.FRM_CODIGO AND pCont.COM_CODIGO=c.COM_CODIGO AND pCont.PRO_NOME='Container'
LEFT JOIN FR_PROPRIEDADE pCSS   ON pCSS.FRM_CODIGO=c.FRM_CODIGO AND pCSS.COM_CODIGO=c.COM_CODIGO AND pCSS.PRO_NOME='NomeClasseCss'
LEFT JOIN FR_PROPRIEDADE pOrdem ON pOrdem.FRM_CODIGO=c.FRM_CODIGO AND pOrdem.COM_CODIGO=c.COM_CODIGO AND pOrdem.PRO_NOME='Ordem'
WHERE c.FRM_CODIGO = 2000
ORDER BY pAba.PRO_VALOR, CAST(COALESCE(pOrdem.PRO_VALOR, '0') AS UNSIGNED);


-- ============================================================================
-- STORED PROCEDURE: Corrige posicionamento automaticamente
-- ============================================================================
-- Usa cursors para iterar e corrigir todos os componentes

DROP PROCEDURE IF EXISTS fix_edital_posicionamento;

DELIMITER //

CREATE PROCEDURE fix_edital_posicionamento()
BEGIN
    DECLARE v_frm INT DEFAULT 2000;
    DECLARE v_com INT;
    DECLARE v_tipo CHAR(1);
    DECLARE v_nome VARCHAR(200);
    DECLARE v_campo VARCHAR(200);
    DECLARE v_aba VARCHAR(100);
    DECLARE v_container VARCHAR(200);
    DECLARE v_css VARCHAR(200);
    DECLARE v_done INT DEFAULT 0;
    
    DECLARE cur_comps CURSOR FOR
        SELECT c.COM_CODIGO, c.COM_TIPO,
               COALESCE(pN.PRO_VALOR, '') AS Nome,
               COALESCE(pC.PRO_VALOR, '') AS Campo,
               COALESCE(pA.PRO_VALOR, '') AS Aba,
               COALESCE(pCont.PRO_VALOR, '') AS Container,
               COALESCE(pCSS.PRO_VALOR, '') AS NomeClasseCss
        FROM FR_COMPONENTE c
        LEFT JOIN FR_PROPRIEDADE pN    ON pN.FRM_CODIGO=c.FRM_CODIGO AND pN.COM_CODIGO=c.COM_CODIGO AND pN.PRO_NOME='Nome'
        LEFT JOIN FR_PROPRIEDADE pC    ON pC.FRM_CODIGO=c.FRM_CODIGO AND pC.COM_CODIGO=c.COM_CODIGO AND pC.PRO_NOME='Campo'
        LEFT JOIN FR_PROPRIEDADE pA    ON pA.FRM_CODIGO=c.FRM_CODIGO AND pA.COM_CODIGO=c.COM_CODIGO AND pA.PRO_NOME='Aba'
        LEFT JOIN FR_PROPRIEDADE pCont ON pCont.FRM_CODIGO=c.FRM_CODIGO AND pCont.COM_CODIGO=c.COM_CODIGO AND pCont.PRO_NOME='Container'
        LEFT JOIN FR_PROPRIEDADE pCSS  ON pCSS.FRM_CODIGO=c.FRM_CODIGO AND pCSS.COM_CODIGO=c.COM_CODIGO AND pCSS.PRO_NOME='NomeClasseCss'
        WHERE c.FRM_CODIGO = v_frm
        ORDER BY c.COM_CODIGO;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = 1;
    
    -- Helper: upsert property
    -- Nao da pra declarar sub-procedures em MariaDB, entao usaremos INSERT ... ON DUPLICATE KEY UPDATE
    -- Mas FR_PROPRIEDADE pode nao ter UNIQUE constraint em (FRM_CODIGO, COM_CODIGO, PRO_NOME)
    -- Entao usamos: DELETE + INSERT para garantir
    
    -- ========================================================================
    -- FASE 1: Mapear containers e labels por aba
    -- ========================================================================
    -- Vamos usar tabelas temporarias para organizar
    
    DROP TEMPORARY TABLE IF EXISTS tmp_layout;
    CREATE TEMPORARY TABLE tmp_layout (
        com_codigo INT,
        com_tipo CHAR(1),
        nome VARCHAR(200),
        campo VARCHAR(200),
        aba VARCHAR(100),
        container_atual VARCHAR(200),
        css_atual VARCHAR(200),
        new_posicao_x INT DEFAULT 0,
        new_posicao_y INT DEFAULT 0,
        new_tamanho INT DEFAULT 200,
        new_altura INT DEFAULT 33,
        new_container VARCHAR(200) DEFAULT '',
        new_css VARCHAR(200) DEFAULT '',
        new_ordem INT DEFAULT 0,
        new_descricao TEXT DEFAULT NULL,
        processed BOOLEAN DEFAULT FALSE
    );
    
    OPEN cur_comps;
    
    read_loop: LOOP
        FETCH cur_comps INTO v_com, v_tipo, v_nome, v_campo, v_aba, v_container, v_css;
        IF v_done THEN
            LEAVE read_loop;
        END IF;
        
        INSERT INTO tmp_layout (com_codigo, com_tipo, nome, campo, aba, container_atual, css_atual)
        VALUES (v_com, v_tipo, v_nome, v_campo, v_aba, v_container, v_css);
    END LOOP;
    
    CLOSE cur_comps;
    
    -- ========================================================================
    -- FASE 2: Atribuir posicoes por Campo (field name matching)
    -- ========================================================================
    -- A logica: para cada campo conhecido, atualizar posicao e CSS
    
    SET @ordem = 1;
    
    -- ---- ABA 01-Dados Gerais ----
    SET @aba = '01-Dados Gerais';
    SET @y = 10;
    
    -- Titulo da aba (primeiro label sem container na aba)
    UPDATE tmp_layout SET 
        new_posicao_x = 16, new_posicao_y = @y, new_tamanho = 1060, new_altura = 60,
        new_container = '', new_css = 'form-group fw-bold text-dark mb-3',
        new_ordem = @ordem, processed = TRUE
    WHERE aba = @aba AND com_tipo = 'L' AND container_atual = '' AND NOT processed
    LIMIT 1;
    SET @ordem = @ordem + 1;
    SET @y = 80;
    
    -- Card Identificacao (primeiro container card na aba)
    SET @card1_y = @y;
    SET @card1_nome = (SELECT nome FROM tmp_layout WHERE aba = @aba AND com_tipo = 'P' 
                       AND (css_atual LIKE '%card%' AND css_atual NOT LIKE '%card-header%')
                       AND NOT processed ORDER BY com_codigo LIMIT 1);
    IF @card1_nome IS NULL THEN
        SET @card1_nome = (SELECT nome FROM tmp_layout WHERE aba = @aba AND com_tipo = 'P' 
                           AND container_atual = '' AND NOT processed ORDER BY com_codigo LIMIT 1);
    END IF;
    
    UPDATE tmp_layout SET 
        new_posicao_x = 16, new_posicao_y = @card1_y, new_tamanho = 1060, new_altura = 620,
        new_container = '', new_css = 'form-group card shadow-sm',
        new_ordem = @ordem, processed = TRUE
    WHERE aba = @aba AND nome = @card1_nome;
    SET @ordem = @ordem + 1;
    
    -- Card header para card1
    SET @header1_nome = (SELECT nome FROM tmp_layout WHERE aba = @aba AND com_tipo = 'P'
                         AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET 
        new_posicao_x = 0, new_posicao_y = 0, new_tamanho = 1060, new_altura = 40,
        new_container = @card1_nome, new_css = 'form-group card-header',
        new_ordem = @ordem, processed = TRUE
    WHERE aba = @aba AND nome = @header1_nome;
    SET @ordem = @ordem + 1;
    
    -- Label do header card1
    UPDATE tmp_layout SET 
        new_posicao_x = 10, new_posicao_y = 5, new_tamanho = 1040, new_altura = 30,
        new_container = @header1_nome, new_css = '',
        new_ordem = @ordem, processed = TRUE,
        new_descricao = '<div class="text-primary card-heading-premium"><i class="fas fa-file-alt"></i> <span>Identificacao do Edital</span></div>'
    WHERE aba = @aba AND com_tipo = 'L' AND NOT processed
    ORDER BY com_codigo LIMIT 1;
    SET @ordem = @ordem + 1;
    
    -- Campos do Card Identificacao (linha a linha, respeitando col-md)
    -- Linha 1: TITULO(8) + NUMERO(4) = 12
    SET @field_y = 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=706, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-8', new_ordem=@ordem, processed=TRUE WHERE campo='TITULO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=736, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='NUMERO' AND NOT processed AND aba=@aba LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 2: ANO(3) + TIPO_FOMENTO(3) + DT_ABERTURA(3) + DT_ENCERRAMENTO(3) = 12
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='ANO_REFERENCIA' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=295, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='TIPO_FOMENTO'   AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=574, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='DT_ABERTURA'    AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=853, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='DT_ENCERRAMENTO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 3: VALOR_TOTAL(4) + PRAZO_INI(4) + PRAZO_FIM(4) = 12
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='VALOR_TOTAL' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=380, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='PRAZO_INSCRICAO_INICIO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=744, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='PRAZO_INSCRICAO_FIM' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 4: LIMITE(3) + DT_PARECER(3) + RECURSOS(2) + CONTRARRAZOES(2) + PRORROGACAO(2) = 12
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='LIMITE_PROJETOS_POR_PRODUTOR' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=295, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='DT_LIBERACAO_PARECER' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=574, new_posicao_y=@field_y, new_tamanho=176, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-2', new_ordem=@ordem, processed=TRUE WHERE campo='PERIODO_RECURSOS' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=764, new_posicao_y=@field_y, new_tamanho=176, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-2', new_ordem=@ordem, processed=TRUE WHERE campo='PERIODO_CONTRARRAZOES' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=954, new_posicao_y=@field_y, new_tamanho=176, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-2', new_ordem=@ordem, processed=TRUE WHERE campo='PERIODO_PRORROGACAO_PROJETO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 5: PRORROGAVEL(2) + HABILITAR_ORC(2) + STATUS(3) + ENCERR_AUTO(3) = 10 (cabe em 12)
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=176, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-2', new_ordem=@ordem, processed=TRUE WHERE campo='PRORROGAVEL' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=206, new_posicao_y=@field_y, new_tamanho=176, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-2', new_ordem=@ordem, processed=TRUE WHERE campo='HABILITAR_ORCAMENTO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=396, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='STATUS' AND NOT processed AND aba=@aba LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=675, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card1_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='ENCERRAMENTO_AUTOMATICO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 6: TEXTO_INFORMATIVO(12)
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@field_y, new_tamanho=1040, new_altura=100, new_container=@card1_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE campo='TEXTO_INFORMATIVO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Recalcular altura do card1
    SET @card1_h = @field_y + 100 + 20;
    UPDATE tmp_layout SET new_altura = @card1_h WHERE nome = @card1_nome;
    
    -- Card Publicacao DO
    SET @y = @card1_y + @card1_h + 10;
    SET @card2_nome = (SELECT nome FROM tmp_layout WHERE aba = @aba AND com_tipo = 'P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    
    UPDATE tmp_layout SET 
        new_posicao_x = 16, new_posicao_y = @y, new_tamanho = 1060, new_altura = 130,
        new_container = '', new_css = 'form-group card shadow-sm',
        new_ordem = @ordem, processed = TRUE
    WHERE aba = @aba AND nome = @card2_nome;
    SET @ordem = @ordem + 1;
    
    -- Card header para card2
    SET @header2_nome = (SELECT nome FROM tmp_layout WHERE aba = @aba AND com_tipo = 'P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET 
        new_posicao_x = 0, new_posicao_y = 0, new_tamanho = 1060, new_altura = 40,
        new_container = @card2_nome, new_css = 'form-group card-header',
        new_ordem = @ordem, processed = TRUE
    WHERE aba = @aba AND nome = @header2_nome;
    SET @ordem = @ordem + 1;
    
    -- Label do header card2
    UPDATE tmp_layout SET 
        new_posicao_x = 10, new_posicao_y = 5, new_tamanho = 1040, new_altura = 30,
        new_container = @header2_nome, new_css = '',
        new_ordem = @ordem, processed = TRUE,
        new_descricao = '<div class="text-primary card-heading-premium"><i class="fas fa-newspaper"></i> <span>Publicacao no Diario Oficial</span></div>'
    WHERE aba = @aba AND com_tipo = 'L' AND NOT processed
    ORDER BY com_codigo LIMIT 1;
    SET @ordem = @ordem + 1;
    
    -- Campos do Card Publicacao: NUMERO_DO(4) + DT_PUBLICACAO_DO(4) = 8
    SET @field_y = 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card2_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='NUMERO_DO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=380, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card2_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='DT_PUBLICACAO_DO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Botoes wizard aba 01
    SET @y = @y + 140;
    UPDATE tmp_layout SET new_posicao_x=720, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-warning', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=890, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-primary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- ---- ABA 02-Elegibilidade ----
    SET @aba = '02-Elegibilidade';
    SET @y = 10;
    
    -- Titulo
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=60, new_container='', new_css='form-group fw-bold text-dark mb-3', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='L' AND container_atual='' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = 80;
    
    -- Card Tipologia
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=200, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-user-tag"></i> <span>Tipologia de Agentes</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=50, new_tamanho=1040, new_altura=100, new_container=@card_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE campo='TIPOLOGIA_AGENTE' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 210;
    
    -- Card Criterios
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=200, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-clipboard-check"></i> <span>Criterios de Elegibilidade</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=50, new_tamanho=1040, new_altura=100, new_container=@card_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE campo='CRITERIOS_ELEGIBILIDADE' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 210;
    
    -- Botoes wizard aba 02
    UPDATE tmp_layout SET new_posicao_x=550, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-secondary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=720, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-warning', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=890, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-primary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- ---- ABA 03-Categorias ----
    SET @aba = '03-Categorias';
    SET @y = 10;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=60, new_container='', new_css='form-group fw-bold text-dark mb-3', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='L' AND container_atual='' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = 80;
    
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=300, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-th-list"></i> <span>Categorias do Edital</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- Grid
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=50, new_tamanho=1040, new_altura=230, new_container=@card_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='G' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 310;
    
    -- Botoes wizard aba 03
    UPDATE tmp_layout SET new_posicao_x=550, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-secondary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=720, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-warning', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=890, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-primary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- ---- ABA 04-Formulario e Documentos ----
    SET @aba = '04-Formulario e Documentos';
    SET @y = 10;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=60, new_container='', new_css='form-group fw-bold text-dark mb-3', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='L' AND container_atual='' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = 80;
    
    -- Card Documentacao
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=300, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-folder-open"></i> <span>Documentacao Exigida</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=50, new_tamanho=1040, new_altura=230, new_container=@card_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='G' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 310;
    
    -- Card Formulario Inscricao
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=130, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-link"></i> <span>Formulario de Inscricao</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=50, new_tamanho=530, new_altura=33, new_container=@card_nome, new_css='form-group col-md-6', new_ordem=@ordem, processed=TRUE WHERE campo='ID_FORMULARIO_INSCRICAO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 140;
    
    -- Botoes wizard aba 04
    UPDATE tmp_layout SET new_posicao_x=550, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-secondary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=720, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-warning', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=890, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-primary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- ---- ABA 05-Avaliacao ----
    SET @aba = '05-Avaliacao';
    SET @y = 10;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=60, new_container='', new_css='form-group fw-bold text-dark mb-3', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='L' AND container_atual='' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = 80;
    
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=300, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-balance-scale"></i> <span>Criterios de Avaliacao</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=50, new_tamanho=1040, new_altura=230, new_container=@card_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='G' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 310;
    
    -- Botoes wizard aba 05
    UPDATE tmp_layout SET new_posicao_x=550, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-secondary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=720, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-warning', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=890, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-primary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- ---- ABA 06-Regras de Fomento ----
    SET @aba = '06-Regras de Fomento';
    SET @y = 10;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=60, new_container='', new_css='form-group fw-bold text-dark mb-3', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='L' AND container_atual='' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = 80;
    
    -- Card Fomento Direto
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=280, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-hand-holding-usd"></i> <span>Fomento Direto</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 1: QTD_MAX(4) + VALOR_MAX(4) + PRAZO(4)
    SET @field_y = 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='QTD_MAX_PROJETOS' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=380, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='VALOR_MAX_PROJETO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=744, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='PRAZO_EXECUCAO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 2: COMISSAO(3) + FASE_RECURSOS(3) + PRESTACAO(3)
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='COMISSAO_AVALIADORA' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=295, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='FASE_RECURSOS' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=574, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='PRESTACAO_CONTAS' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 3: TERRITORIALIZACAO(12)
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@field_y, new_tamanho=1040, new_altura=80, new_container=@card_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE campo='TERRITORIALIZACAO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    SET @y = @y + 290;
    
    -- Card Fomento Indireto
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=190, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-university"></i> <span>Fomento Indireto</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 1: SUBTIPO(4) + RENUNCIA(4) + CONTRIBUINTE(4)
    SET @field_y = 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='SUBTIPO_INDIRETO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=380, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='LIMITE_RENUNCIA_FISCAL' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=744, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='VALOR_MAX_CONTRIBUINTE' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 2: GR_ECONOMICO(4) + ANO_ISS(3) + TIPO_ISS(5)
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='VALOR_GRUPO_ECONOMICO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=380, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='ANO_EXERCICIO_ISS' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=659, new_posicao_y=@field_y, new_tamanho=440, new_altura=33, new_container=@card_nome, new_css='form-group col-md-5', new_ordem=@ordem, processed=TRUE WHERE campo='TIPO_EDITAL_ISS' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    -- Linha 3: PCT_MAX(3)
    SET @field_y = @field_y + 50;
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@field_y, new_tamanho=265, new_altura=33, new_container=@card_nome, new_css='form-group col-md-3', new_ordem=@ordem, processed=TRUE WHERE campo='PCT_MAX_ISS_CONTRIBUINTE' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    
    SET @y = @y + 200;
    
    -- Botoes wizard aba 06
    UPDATE tmp_layout SET new_posicao_x=550, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-secondary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=720, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-warning', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=890, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-primary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- ---- ABA 07-Orcamento ----
    SET @aba = '07-Orcamento';
    SET @y = 10;
    
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=60, new_container='', new_css='form-group fw-bold text-dark mb-3', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='L' AND container_atual='' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = 80;
    
    -- Card Configuracoes
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=130, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-sliders-h"></i> <span>Configuracoes de Orcamento</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    SET @field_y = 50;
    UPDATE tmp_layout SET new_posicao_x=16,  new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='CALCULAR_IMPOSTO_RETIDO' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=380, new_posicao_y=@field_y, new_tamanho=350, new_altura=33, new_container=@card_nome, new_css='form-group col-md-4', new_ordem=@ordem, processed=TRUE WHERE campo='PERMITIR_SUGESTAO_ITENS' AND NOT processed LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 140;
    
    -- Card Grupos de Despesa
    SET @card_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=16, new_posicao_y=@y, new_tamanho=1060, new_altura=300, new_container='', new_css='form-group card shadow-sm', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@card_nome; SET @ordem=@ordem+1;
    
    SET @hdr_nome = (SELECT nome FROM tmp_layout WHERE aba=@aba AND com_tipo='P' AND NOT processed ORDER BY com_codigo LIMIT 1);
    UPDATE tmp_layout SET new_posicao_x=0, new_posicao_y=0, new_tamanho=1060, new_altura=40, new_container=@card_nome, new_css='form-group card-header', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND nome=@hdr_nome; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=5, new_tamanho=1040, new_altura=30, new_container=@hdr_nome, new_css='', new_ordem=@ordem, processed=TRUE, new_descricao='<div class="text-primary card-heading-premium"><i class="fas fa-money-bill-wave"></i> <span>Grupos de Despesa do Edital</span></div>' WHERE aba=@aba AND com_tipo='L' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    UPDATE tmp_layout SET new_posicao_x=10, new_posicao_y=50, new_tamanho=1040, new_altura=230, new_container=@card_nome, new_css='form-group col-md-12', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='G' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    SET @y = @y + 310;
    
    -- Botoes wizard aba 07
    UPDATE tmp_layout SET new_posicao_x=550, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-secondary', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=720, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-warning', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    UPDATE tmp_layout SET new_posicao_x=890, new_posicao_y=@y, new_tamanho=150, new_altura=33, new_container='', new_css='btn-success', new_ordem=@ordem, processed=TRUE WHERE aba=@aba AND com_tipo='B' AND NOT processed ORDER BY com_codigo LIMIT 1; SET @ordem=@ordem+1;
    
    -- ========================================================================
    -- FASE 3: Aplicar as correcoes na tabela FR_PROPRIEDADE
    -- ========================================================================
    
    -- Atualizar PosicaoX
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = CAST(t.new_posicao_x AS CHAR)
    WHERE p.PRO_NOME = 'PosicaoX' AND t.processed = TRUE;
    
    -- Atualizar PosicaoY
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = CAST(t.new_posicao_y AS CHAR)
    WHERE p.PRO_NOME = 'PosicaoY' AND t.processed = TRUE;
    
    -- Atualizar Tamanho
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = CAST(t.new_tamanho AS CHAR)
    WHERE p.PRO_NOME = 'Tamanho' AND t.processed = TRUE;
    
    -- Atualizar Altura
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = CAST(t.new_altura AS CHAR)
    WHERE p.PRO_NOME = 'Altura' AND t.processed = TRUE;
    
    -- Atualizar Container
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = t.new_container
    WHERE p.PRO_NOME = 'Container' AND t.processed = TRUE;
    
    -- Atualizar NomeClasseCss (so onde tem CSS novo nao-vazio, para nao apagar CSS de componentes tipo F)
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = t.new_css
    WHERE p.PRO_NOME = 'NomeClasseCss' AND t.processed = TRUE AND t.new_css != '' AND t.com_tipo != 'F';
    
    -- Atualizar Ordem
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = CAST(t.new_ordem AS CHAR)
    WHERE p.PRO_NOME = 'Ordem' AND t.processed = TRUE AND t.new_ordem > 0;
    
    -- Atualizar Descricao dos labels de header (onde new_descricao nao e NULL)
    UPDATE FR_PROPRIEDADE p
    INNER JOIN tmp_layout t ON p.COM_CODIGO = t.com_codigo AND p.FRM_CODIGO = v_frm
    SET p.PRO_VALOR = t.new_descricao
    WHERE p.PRO_NOME = 'Descricao' AND t.processed = TRUE AND t.new_descricao IS NOT NULL;
    
    -- Inserir NomeClasseCss para componentes que nao tem essa property
    INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR)
    SELECT v_frm, t.com_codigo, 'NomeClasseCss', t.new_css
    FROM tmp_layout t
    WHERE t.processed = TRUE AND t.new_css != '' AND t.com_tipo != 'F'
    AND NOT EXISTS (
        SELECT 1 FROM FR_PROPRIEDADE p 
        WHERE p.FRM_CODIGO = v_frm AND p.COM_CODIGO = t.com_codigo AND p.PRO_NOME = 'NomeClasseCss'
    );
    
    -- Inserir Container para componentes que nao tem essa property
    INSERT INTO FR_PROPRIEDADE (FRM_CODIGO, COM_CODIGO, PRO_NOME, PRO_VALOR)
    SELECT v_frm, t.com_codigo, 'Container', t.new_container
    FROM tmp_layout t
    WHERE t.processed = TRUE AND t.com_tipo != 'F'
    AND NOT EXISTS (
        SELECT 1 FROM FR_PROPRIEDADE p 
        WHERE p.FRM_CODIGO = v_frm AND p.COM_CODIGO = t.com_codigo AND p.PRO_NOME = 'Container'
    );
    
    -- Relatorio final
    SELECT 
        COUNT(*) AS total_processados,
        SUM(CASE WHEN processed THEN 1 ELSE 0 END) AS corrigidos,
        SUM(CASE WHEN NOT processed AND com_tipo != 'F' THEN 1 ELSE 0 END) AS nao_processados
    FROM tmp_layout;
    
    -- Listar nao processados (para debug)
    SELECT com_codigo, com_tipo, nome, campo, aba, 'NAO PROCESSADO' AS status
    FROM tmp_layout
    WHERE NOT processed AND com_tipo != 'F';
    
    DROP TEMPORARY TABLE IF EXISTS tmp_layout;
    
END //

DELIMITER ;

-- ============================================================================
-- EXECUTAR A CORRECAO
-- ============================================================================
-- Descomentar a linha abaixo e executar (Alt+X) para aplicar:

-- CALL fix_edital_posicionamento();

-- Apos executar, verificar com a query diagnostica no topo do arquivo.
