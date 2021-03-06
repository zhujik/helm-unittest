
# borrowed from https://github.com/technosophos/helm-template

HELM_HOME ?= $(shell helm home)
HELM_PLUGIN_DIR ?= $(HELM_HOME)/plugins/helm-unittest
VERSION := $(shell sed -n -e 's/version:[ "]*\([^"]*\).*/\1/p' plugin.yaml)
DIST := $(CURDIR)/_dist
LDFLAGS := "-X main.version=${VERSION} -extldflags '-static'"
DOCKER ?= "zhujik/helm-unittest"

.PHONY: install
install: bootstrap build
	mkdir -p $(HELM_PLUGIN_DIR)
	cp untt $(HELM_PLUGIN_DIR)
	cp plugin.yaml $(HELM_PLUGIN_DIR)

.PHONY: hookInstall
hookInstall: bootstrap build

.PHONY: build
build:
	go build -o untt -ldflags $(LDFLAGS) ./main.go

.PHONY: dist
dist:
	mkdir -p $(DIST)
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o untt -ldflags $(LDFLAGS) ./main.go
	tar -zcvf $(DIST)/helm-unittest-linux-$(VERSION).tgz untt README.md LICENSE plugin.yaml --force-local
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o untt -ldflags $(LDFLAGS) ./main.go
	tar -zcvf $(DIST)/helm-unittest-macos-$(VERSION).tgz untt README.md LICENSE plugin.yaml --force-local
	
.PHONY: dist-win
dist-win:
	mkdir -p $(DIST)	
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o untt.exe -ldflags $(LDFLAGS) ./main.go
	tar -zcvf $(DIST)/helm-unittest-windows-$(VERSION).tgz untt.exe README.md LICENSE plugin.yaml --force-local 

.PHONY: bootstrap
bootstrap:

dockerimage:
	docker build -t $(DOCKER):$(VERSION) .
