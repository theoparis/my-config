# Starship prompt
starship init fish | source

set -gx EDITOR "nvim"
set -gx N_PREFIX ~/n
set -gx SHELL (which fish)
set -gx PATH ~/bin ~/n/bin ~/.cargo/bin ~/.nimble/bin ~/.local/bin ~/local/bin/kt-server/bin ~/.dprint/bin ~/.deno/bin $PATH

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
alias gro="xdg-open (git config --get remote.origin.url)"
if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

macchina -H kernel


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
