#!/bin/zsh
if which go; then
  export PATH=$(go env GOPATH)/bin:$PATH
fi
