# Git

git_prepare() {
    if [ -n "$BUFFER" ];
        then
            BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
    fi

    if [ -z "$BUFFER" ];
        then
            BUFFER="git add -A && git commit -v && git push"
    fi
            
    zle accept-line
}
zle -N git_prepare
bindkey "^g" git_prepare

# Sudo
add_sudo() {
	BUFFER="sudo "$BUFFER
    zle end-of-line
}
zle -N add_sudo
bindkey "^s" add_sudo

# Home - Navigates to the current root workspace
git_root() {
    BUFFER="cd $(git rev-parse --show-toplevel || echo ".")"
    zle accept-line
}
zle -N git_root
bindkey "^h" git_root

# up a directory
up_widget() {
    BUFFER="cd .."
    zle accept-line
}
zle -N up_widget
bindkey "^k" up_widget

