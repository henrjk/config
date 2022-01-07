#!/bin/zsh
if which -s go > /dev/null ; then
  export PATH=$(go env GOPATH)/bin:$PATH
fi
