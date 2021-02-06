export ZSH="$HOME/.oh-my-zsh"
plugins=(git docker)
export PATH="$HOME/.local/bin:$PATH"
# https://starship.rs/
eval "$(starship init zsh)"
# VIM ftw
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
# Open git repo url in browser
alias gro="xdg-open $(git config --get remote.origin.url)"
