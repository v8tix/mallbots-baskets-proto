include .envrc

# ==================================================================================== #
# HELPERS
# ==================================================================================== #

## help: print this help message
.PHONY: help
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

# ==============================================================================

# ==================================================================================== #
# TOOLS
# ==================================================================================== #

## tools/install: install all needed tools
.PHONY: tools/install
tools/install:
	@echo "installing tools ..."
	@go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
	@go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest
	@go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	@go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	@echo "done"
# ==============================================================================

## tools/generate: calls code generation tools
.PHONY: tools/generate
tools/generate:
	@echo "running code generation ..."
	@go generate ./...
	@echo done
# ==============================================================================
