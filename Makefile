ROOT:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SHAZAM_PROXY_OUT:=$(ROOT)/bin/shazam-proxy
SHAZAM_CC_OUT:=$(ROOT)/bin/shazam-cc
PKG:=$(shell go list -m)

.PHONY: all build shazam-proxy shazam-cc parser clean test build_with_coverage
all: build test

build: parser shazam-proxy shazam-cc

shazam-proxy:
	go build -o $(SHAZAM_PROXY_OUT) $(shell bash gen_ldflags.sh $(SHAZAM_PROXY_OUT) $(PKG)/core $(PKG)/cmd/shazam-proxy)

shazam-cc:
	go build -o $(SHAZAM_CC_OUT) $(shell bash gen_ldflags.sh $(SHAZAM_CC_OUT) $(PKG)/core $(PKG)/cmd/shazam-cc)

parser:
	cd parser && make && cd ..

clean:
	@rm -rf bin
	@rm -f .coverage.out .coverage.html

test:
	go test -coverprofile=.coverage.out ./...
	go tool cover -func=.coverage.out -o .coverage.func
	tail -1 .coverage.func
	go tool cover -html=.coverage.out -o .coverage.html

build_with_coverage:
	go test -c cmd/shazam/main.go cmd/shazam/main_test.go -coverpkg ./... -covermode=count -o bin/shazam
