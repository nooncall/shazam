#!/bin/bash

version=`git log --date=iso --pretty=format:"%cd @%h" -1`
if [ $? -ne 0 ]; then
    version="not a git repo"
fi

compile=`date +"%F %T %z"`" by "`go version`

cat << EOF | gofmt > core/version.go
package core

const (
    // Version means shazam version
    Version = "$version"
    // Compile means shazam compole info
    Compile = "$compile"
)
EOF
