#!/bin/sh
cd /workplace/go/src/github.com/golang/lint
go install
cd /workplace/go/src/github.com/golang/lint/golint
go install
cd /workplace/go/src/golang.org/x/tools/cmd/goimports
go install
cd /workplace/go/src/golang.org/x/tools/cmd/oracle
go install
cd /workplace/go/src/github.com/rogpeppe/godef
go install
cd /workplace/go/src/golang.org/x/tools/cmd/gorename
go install
cd /workplace/go/src/github.com/kisielk/errcheck
go install
cd /workplace/go/src/github.com/nsf/gocode
go install
cd /workplace/go/src/github.com/jstemmer/gotags
go install
