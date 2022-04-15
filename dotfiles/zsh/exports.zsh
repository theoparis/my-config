#!/usr/bin/env zsh
# shellcheck shell=bash
# Exports
export USER_ID=$(id -u)
export KUBECONFIG="$HOME/.kube/config"
export GOPATH=$HOME/go
export GLFW_IM_MODULE=none
export PATH="$PATH:/usr/lib/jvm/java-16-openjdk/bin:$HOME/my-config/scripts/bin:/usr/local/go/bin:/opt/riscv/bin:$HOME/.ops/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.deno/bin:$HOME/sdk/go/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.gem/ruby/3.0.0/bin:$HOME/.nimble/bin:$HOME/.local/bin:$HOME/.n/bin:$HOME/.krew/bin"
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERM="rxvt-256color"
export NVM_DIR="$HOME/.nvm"
export SXHKD_SHELL="$SHELL"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
export MOZ_DBUS_REMOTE=1
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$PATH:$JAVA_HOME/bin"

if [ -e "$HOME/.nix-defexpr/channels" ]; then
    export NIX_PATH="$HOME/.nix-defexpr/channels${NIX_PATH:+:$NIX_PATH}"
fi

# Projects Folder For Quick Navigation
export DEV_FOLDER="$HOME/dev"

# Node version mamager (https://github.com/tj/n)
export N_PREFIX="$HOME/.n"
export _JAVA_AWT_WM_NONREPARTENTING=1
export LIBRARY_PATH="/usr/local/lib:$LIBRARY_PATH"
