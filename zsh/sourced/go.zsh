#!/bin/zsh
if which -s go; then
  export PATH=$(go env GOPATH)/bin:$PATH
fi
