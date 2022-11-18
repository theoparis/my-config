source ~/.znap/zsh-snap/znap.zsh
#!/bin/zsh

export fpath=(~/.zfunc "${fpath[@]}")

# Exports
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/functions.zsh"


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

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export GPG_TTY=$(tty)

# bun completions
[ -s "/home/theo/.bun/_bun" ] && source "/home/theo/.bun/_bun"
