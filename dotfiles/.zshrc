source ~/.znap/zsh-snap/znap.zsh
#!/bin/zsh

export fpath=(~/.zfunc "${fpath[@]}")

# Exports
source "$HOME/.config/zsh/exports.zsh"
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/functions.zsh"

znap prompt romkatv/powerlevel10k
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

export GPG_TTY=$(tty)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -s "$HOME/bun/_bun" ] && source "$HOME/bun/_bun"

[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile"

export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

