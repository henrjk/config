alias ll='ls -lAh'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias intel='arch -x86_64'

#
alias archdocker="docker info -f '{{.OSType}}/{{.Architecture}}'"
alias archdockervalues='echo "docker desktop architecture values:\nlinux/aarch64 (M1) linux/x86_64 (MBP intel)"'

# candidates for alias

# docker run --rm --entrypoint=bash -it image-name

# docker image inspect postgres:12 -f '{{.Os}}/{{.Architecture}}'
# linux/arm64
# → docker image inspect atlassian/bitbucket:7.6.5 -f '{{.Os}}/{{.Architecture}}'
# linux/amd64
# → docker info -f '{{.OSType}}/{{.Architecture}}'
# linux/aarch64

gpip3(){
   PIP_REQUIRE_VIRTUALENV="0" pip3 "$@"
}

gpip2(){
   PIP_REQUIRE_VIRTUALENV="0" pip2 "$@"
}

# https://stackoverflow.com/a/30029855
listening() {
    if [ $# -eq 0 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}
