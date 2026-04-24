.PHONY: build test install clean release check

BINARY_NAME := frz-compiler
INSTALL_DIR := ../mcp_maker/bin
RELEASE_DIR := target/release

build:
	cargo build --release

test:
	cargo test

check:
	cargo check

install: build
	@mkdir -p $(INSTALL_DIR)
	cp $(RELEASE_DIR)/$(BINARY_NAME) $(INSTALL_DIR)/$(BINARY_NAME)
	@echo "Instalado em $(INSTALL_DIR)/$(BINARY_NAME)"

clean:
	cargo clean

release: build test
	@echo "Build release pronto: $(RELEASE_DIR)/$(BINARY_NAME)"
	@ls -lh $(RELEASE_DIR)/$(BINARY_NAME)

bench: build
	@echo "Benchmark: 1 regra via stdin"
	@echo '{"regras":[{"nome":"Bench","destino":2,"codigo":1,"parametros":[],"variaveis":[{"nome":"v","tipo":"Letras"}],"passos":[{"tipo":"expressao","nome":"s1","descricao":"t","funcao":"ebfConcat","nome_amigavel":"Concat","params":[{"tipo":"constante","valor":"a","tipo_dado":"Letras"}],"retorno":"v","tipo_retorno":"Letras"}]}]}' | time $(RELEASE_DIR)/$(BINARY_NAME) --output /tmp/bench.frz
