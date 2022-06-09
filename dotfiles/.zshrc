#!/bin/env zsh
# shellcheck shell=bash

#zmodload zsh/zprof

export fpath=(~/.zfunc "${fpath[@]}")

# Exports
if test -f ~/zsh/exports.zsh; then
	source "$HOME/zsh/exports.zsh"
fi

if test -f ~/zsh/aliases.zsh; then
	source "$HOME/zsh/aliases.zsh"
fi

if test -f ~/zsh/functions.zsh; then
	source "$HOME/zsh/functions.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# Plugins
zinit ice as"command" from"gh-r" \
          atclone"./starship completions zsh > _starship" \
          atpull"%atclone"
zinit light starship/starship
zinit ice wait"2" as"command" from"gh-r" lucid \
  atpull"%atclone" nocompile'!'
zinit light ajeetdsouza/zoxide
zinit ice from"gh-r" as"program"
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light z-shell/F-Sy-H

zstyle ":completion:*" use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ":autocomplete:*" min-input 1

[[ -f ~/.config/zsh/user.zsh ]] && source "$HOME/.config/zsh/user.zsh"

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
	source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Compinit for shell autocompletion
autoload -Uz compinit
compinit

# OPS config
if [ -f "$OPS_DIR/scripts/bash_completion.sh" ]; then
	source "$OPS_DIR/scripts/bash_completion.sh"
fi

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#zprof

# Wasmer
export WASMER_DIR="/home/theo/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fnm env --shell=zsh)"

