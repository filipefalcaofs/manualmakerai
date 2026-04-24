#!/bin/bash
# Setup do MCP maker-flow-engine
# Uso: ./setup.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== MCP maker-flow-engine - Setup ==="
echo "Diretorio: $SCRIPT_DIR"
echo ""

# Verificar Python 3.13+
if ! command -v python3.13 &>/dev/null; then
    if ! command -v python3 &>/dev/null; then
        echo "ERRO: Python 3.13+ nao encontrado."
        echo "Instale: https://www.python.org/downloads/"
        exit 1
    fi
    PYTHON="python3"
else
    PYTHON="python3.13"
fi

echo "Python: $($PYTHON --version)"

# Criar venv
if [ ! -d "$SCRIPT_DIR/.venv" ]; then
    echo "Criando venv..."
    $PYTHON -m venv "$SCRIPT_DIR/.venv"
fi

# Instalar dependencias
echo "Instalando dependencias..."
"$SCRIPT_DIR/.venv/bin/pip" install -q -r "$SCRIPT_DIR/requirements.txt"

# Testar
echo "Testando servidor..."
"$SCRIPT_DIR/.venv/bin/python" -c "
import sys
sys.path.insert(0, '$PROJECT_DIR')
from mcp_maker.server import mcp, _funcoes
idx = _funcoes()
tools = mcp._tool_manager.list_tools()
print(f'  {len(idx.funcoes)} funcoes nativas')
print(f'  {len(tools)} tools MCP')
print('  OK!')
" 2>/dev/null

VENV_PYTHON="$SCRIPT_DIR/.venv/bin/python"

echo ""
echo "=== Configuracao para Cursor ==="
echo ""
echo "Adicione ao .cursor/mcp.json do seu projeto (ou ao global ~/.cursor/mcp.json):"
echo ""
cat <<JSONEOF
{
  "mcpServers": {
    "maker-flow-engine": {
      "command": "$VENV_PYTHON",
      "args": ["-m", "mcp_maker"],
      "cwd": "$PROJECT_DIR",
      "env": {
        "PYTHONPATH": "$PROJECT_DIR"
      }
    }
  }
}
JSONEOF
echo ""
echo "Depois reinicie o Cursor ou clique em 'Reload MCP Servers'."
