#!/bin/zsh

export fpath=(~/.zfunc "${fpath[@]}")

# Exports
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/functions.zsh"

source ~/.znap/zsh-snap/znap.zsh

znap source zsh-users/zsh-autosuggestions
znap source z-shell/F-Sy-H

znap function _pyenv pyenvn 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

zstyle ":completion:*" use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ":autocomplete:*" min-input 1

[[ -f ~/.config/zsh/user.zsh ]] && source "$HOME/.config/zsh/user.zsh"

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

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export GPG_TTY=$(tty)

source /home/theo/.config/broot/launcher/bash/br
