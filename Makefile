
.PHONY: install
install:
	go install github.com/osspkg/devtool@latest

.PHONY: setup
setup:
	devtool setup-lib

.PHONY: lint
lint:
	devtool lint

.PHONY: license
license:
	devtool license

.PHONY: build
build:
	devtool build --arch=amd64

.PHONY: tests
tests:
	devtool test

.PHONY: pre-commite
pre-commite: setup lint build tests

.PHONY: ci
ci: install setup lint build tests

run_local:
	go run cmd/jasta/main.go --config=config/config.dev.yaml

prerender_local:
	go run cmd/jasta/main.go prerender

deb:
	deb-builder build

local: build
	cp ./build/jasta_amd64 $(GOPATH)/bin/jasta