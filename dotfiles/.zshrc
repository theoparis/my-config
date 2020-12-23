# Node.js
# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export PATH="$HOME/.local/bin:$PATH"
# https://starship.rs/
eval "$(starship init zsh)"
export EDITOR="vim"
export VISUAL="vim"
# Git alias shortcuts
alias gbr="git branch"
alias gps="git push"
alias gpl="git pull"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gst="git status"
alias gdf="git diff"
alias gad="git add"
alias gch="git checkout"
alias gchb="git checkout -b"
# Open url in browser
alias gro="xdg-open $(git config --get remote.origin.url)"
