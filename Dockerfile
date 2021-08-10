FROM ghcr.io/greyltc/archlinux-aur:paru

RUN sudo -u ab -D~ bash -c 'paru -Syu --removemake --needed --noprogressbar --noconfirm stow zsh fzf tmux'

