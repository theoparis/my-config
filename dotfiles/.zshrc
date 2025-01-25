#!/usr/bin/env zsh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if test ! -d "$ZINIT_HOME"; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone -j$(coreutils nproc) https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

export fpath=(~/.zfunc "${fpath[@]}")

zinit ice depth"1"
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zstyle ":completion:*" use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ":autocomplete:*" min-input 1

# Compinit for shell autocompletion
autoload -Uz compinit
compinit

export GPG_TTY=$(tty)

export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# Modules 
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/functions.zsh"

# User Configuration
test -f $HOME/config/zsh/user.zsh && source "$HOME/.config/zsh/user.zsh"

# Try to load pyenv
if test -d "$HOME/.pyenv"; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export LD_LIBRARY_PATH=$HOME/llvm/lib/x86_64-unknown-linux-gnu:$LD_LIBRARY_PATH
export PAGER=bat

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

. ~/.profile
eval "$(starship init zsh)"

