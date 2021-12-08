.PHONY: build test testgen

GENDIR ?= ./testdata

# make sure we turn on go modules
export GO111MODULE := on

build:
	go build -mod=readonly ./cmd/testgen-smt

test:
	go test -mod=readonly .

# Usage: GENDIR=../ics23/testdata/smt make testgen
testgen:
	@mkdir -p "$(GENDIR)"
	go run -mod=readonly ./cmd/testgen-smt exist left 987 > "$(GENDIR)"/exist_left.json
	go run -mod=readonly ./cmd/testgen-smt exist middle 812 > "$(GENDIR)"/exist_middle.json
	go run -mod=readonly ./cmd/testgen-smt exist right 1261 > "$(GENDIR)"/exist_right.json
	go run -mod=readonly ./cmd/testgen-smt nonexist left 813 > "$(GENDIR)"/nonexist_left.json
	go run -mod=readonly ./cmd/testgen-smt nonexist middle 691 > "$(GENDIR)"/nonexist_middle.json
	go run -mod=readonly ./cmd/testgen-smt nonexist right 1535 > "$(GENDIR)"/nonexist_right.json
	go run -mod=readonly ./cmd/testgen-smt batch 1801 20 0 > "$(GENDIR)"/batch_exist.json
	go run -mod=readonly ./cmd/testgen-smt batch 1807 0 20 > "$(GENDIR)"/batch_nonexist.json
