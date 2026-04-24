#!/usr/bin/env bash
set -euo pipefail

# Instalador do frz-compiler para o MCP Maker Flow Engine.
# Detecta OS/arch e compila localmente ou baixa binario pre-compilado.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
FRZ_DIR="$SCRIPT_DIR/frz-compiler"
BIN_DIR="$SCRIPT_DIR/mcp_maker/bin"
BINARY="$BIN_DIR/frz-compiler"

REPO="filipefalcaofs/manualmakerai"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[OK]${NC} $1"; }
warn()  { echo -e "${YELLOW}[!!]${NC} $1"; }
error() { echo -e "${RED}[ERRO]${NC} $1"; exit 1; }

detect_platform() {
    local os arch
    os="$(uname -s | tr '[:upper:]' '[:lower:]')"
    arch="$(uname -m)"

    case "$os" in
        darwin) os="darwin" ;;
        linux)  os="linux" ;;
        mingw*|msys*|cygwin*) os="windows" ;;
        *) error "SO nao suportado: $os" ;;
    esac

    case "$arch" in
        x86_64|amd64) arch="x64" ;;
        aarch64|arm64) arch="arm64" ;;
        *) error "Arquitetura nao suportada: $arch" ;;
    esac

    echo "${os}-${arch}"
}

build_local() {
    info "Compilando frz-compiler localmente..."

    if ! command -v cargo &>/dev/null; then
        warn "Rust nao encontrado. Instalando via rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi

    cd "$FRZ_DIR"
    cargo build --release
    cargo test

    mkdir -p "$BIN_DIR"
    cp target/release/frz-compiler "$BINARY"
    chmod +x "$BINARY"

    info "Compilado e instalado em $BINARY"
}

download_binary() {
    local platform="$1"
    local name="frz-compiler-${platform}"
    [ "$platform" = "windows-x64" ] && name="${name}.exe"

    local tag
    tag="$(curl -sS "https://api.github.com/repos/$REPO/releases/latest" \
        | grep '"tag_name"' | head -1 | cut -d'"' -f4)" || true

    if [ -z "$tag" ]; then
        warn "Nenhuma release encontrada. Compilando localmente..."
        build_local
        return
    fi

    local url="https://github.com/$REPO/releases/download/$tag/$name"
    info "Baixando $name ($tag)..."

    mkdir -p "$BIN_DIR"
    if curl -sSL --fail -o "$BINARY" "$url"; then
        chmod +x "$BINARY"
        info "Instalado em $BINARY"
    else
        warn "Download falhou. Compilando localmente..."
        build_local
    fi
}

setup_python() {
    local venv_dir="$SCRIPT_DIR/mcp_maker/.venv"

    if [ ! -d "$venv_dir" ]; then
        info "Criando virtualenv Python..."
        python3 -m venv "$venv_dir"
    fi

    source "$venv_dir/bin/activate"

    if ! python3 -c "import mcp" &>/dev/null; then
        info "Instalando dependencias Python..."
        pip install -q "mcp[cli]"
    fi

    info "Python OK ($(python3 --version))"
}

verify() {
    if [ ! -x "$BINARY" ]; then
        error "Binario nao encontrado em $BINARY"
    fi

    local version
    version="$("$BINARY" --help 2>&1 | head -1)" || true
    info "frz-compiler: $version"

    echo '{"regras":[{"nome":"Teste","destino":2,"codigo":1,"parametros":[],"variaveis":[{"nome":"v","tipo":"Letras"}],"passos":[{"tipo":"expressao","nome":"s","descricao":"t","funcao":"ebfConcat","nome_amigavel":"C","params":[{"tipo":"constante","valor":"ok","tipo_dado":"Letras"}],"retorno":"v","tipo_retorno":"Letras"}]}]}' \
        | "$BINARY" --output /tmp/frz_setup_test.frz >/dev/null 2>&1

    if [ -f /tmp/frz_setup_test.frz ]; then
        local size
        size="$(wc -c < /tmp/frz_setup_test.frz | tr -d ' ')"
        info "Teste de compilacao OK ($size bytes)"
        rm -f /tmp/frz_setup_test.frz
    else
        error "Teste de compilacao falhou"
    fi
}

main() {
    echo ""
    echo "=== Setup do MCP Maker Flow Engine ==="
    echo ""

    local mode="${1:-auto}"
    local platform
    platform="$(detect_platform)"
    info "Plataforma detectada: $platform"

    case "$mode" in
        build)
            build_local
            ;;
        download)
            download_binary "$platform"
            ;;
        auto)
            if command -v cargo &>/dev/null; then
                build_local
            else
                download_binary "$platform"
            fi
            ;;
        *)
            echo "Uso: $0 [auto|build|download]"
            echo "  auto     - compila se Rust disponivel, senao baixa binario (padrao)"
            echo "  build    - compila localmente (instala Rust se necessario)"
            echo "  download - baixa binario pre-compilado do GitHub Releases"
            exit 0
            ;;
    esac

    setup_python
    verify

    echo ""
    info "Setup completo!"
    echo ""
    echo "  Para usar o MCP server:"
    echo "    cd $SCRIPT_DIR"
    echo "    source mcp_maker/.venv/bin/activate"
    echo "    python -m mcp_maker.server"
    echo ""
    echo "  Ou adicione ao Cursor/Claude (Settings > MCP):"
    echo "    Command: python -m mcp_maker.server"
    echo "    Args: []"
    echo "    Cwd: $SCRIPT_DIR"
    echo ""
}

main "$@"
