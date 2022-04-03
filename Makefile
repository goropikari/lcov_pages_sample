SHELL = /bin/bash

ROOT_DIR = $(shell pwd)
GOBIN = $(ROOT_DIR)/bin
export PATH := $(ROOT_DIR)/bin:$(PATH)

.PHONY: tools
tools:
	GOBIN=$(GOBIN) go install github.com/jandelgado/gcov2lcov@v1.0.5

.PHONY: coverage
coverage:
	# lcov
	go test -cover ./... -coverprofile=coverage.out
	bin/gcov2lcov -infile=coverage.out -outfile=coverage.lcov
	genhtml coverage.lcov -o site
	# go coverage
	go tool cover -html=coverage.out -o site/gocoverage.html
