module github.com/confio/ics23-smt

go 1.14

require (
	github.com/confio/ics23/go v0.0.0-20200323120010-7d9a00f0a2fa // update-proto-spec
	github.com/lazyledger/smt v0.2.1-0.20210709230900-03ea40719554
)

replace github.com/confio/ics23/go => ../ics23/go
