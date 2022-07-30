#!/bin/fish
# shellcheck shell=bash

# aliases
# 256 color support
alias tmux="tmux -2 -u" # for 256color

alias d='f $DEV_FOLDER'
alias L="sudo -E zsh -ic 'l'"
alias l="xplr"
alias ls="exa -a --time-style=hide --color=always --icons"
alias lsl="exa -la --color=always --icons"
alias rm="rm -i"
alias mv="mv -n"
alias cp="cp -n"
alias cat="bat -pp"
alias s="doas"
alias sedit="doasedit"
alias pwease="s"
alias pweasedit="sedit"
alias nmp="ncmpcpp"
# Git aliases
alias g="git"
alias gbr="fzf-git-branch"
alias gps="git push"
alias gpl="git pull"
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gst="git status"
alias gdf="git diff"
alias gad="git add"
alias gch="fzf-git-checkout"
alias gchb="git checkout -b"
alias gl="git log --abbrev-commit --date=local --name-status --pretty   --color --decorate --graph"
alias gw="git worktree"
alias gwa="git worktree add"
alias gro='xdg-open $(git remote get-url origin)'

