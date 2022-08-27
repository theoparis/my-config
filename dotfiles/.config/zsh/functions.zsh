#!/usr/bin/env zsh
# shellcheck shell=bash

emsource() {
    source "$HOME/emsdk/emsdk_env.sh"
}

rf() {
    sk --ansi -i -c 'rg --color=always --line-number "{}"'
}

# curl speed test for a site
wst() {
    curl -s -w 'Testing Website Response Time for :%{url_effective}\n\nLookup Time:\t\t%{time_namelookup}\nConnect Time:\t\t%{time_connect}\nAppCon Time:\t\t%{time_appconnect}\nRedirect Time:\t\t%{time_redirect}\nPre-transfer Time:\t%{time_pretransfer}\nStart-transfer Time:\t%{time_starttransfer}\n\nTotal Time:\t\t%{time_total}\n' -o /dev/null "$1"
}

batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff "$1"
}

## fzf search for a folder, then cd into it
f() {
    if [ "${1:-""}" != "" ]; then
        folder=$(fd -t d "$1" | fzf)
        cd "$1/$folder" || return 1
    else
        folder=$(fd -t d | fzf)
        cd "$folder" || return 1
    fi
}

sftpu() {
    localFile="$1"
    remotePath="$2"

    sftp "${remotePath}" <<<"put ${localFile}"
}

# lm-sensors get specific sensor
sensor() {
    sensors | grep "$1" | cut -f2- -d: | tr -d '  '
}

genMacAddr() {
    echo "openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/:$//'"
}

gen-pass() {
    tr -cd '[:alnum:]' </dev/urandom | fold -w"${1:-'32'}" | head -n1
}

fzf-git-branch() {
    git rev-parse HEAD >/dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% --preview "git log -n 50 --color=always --date=short --pretty='format:%C(auto)%cd %h%d %s' $(sed 's/.* //' <<<{})" | sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD >/dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track "$branch"
    else
        git checkout "$branch"
    fi
}

mem() {
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}
