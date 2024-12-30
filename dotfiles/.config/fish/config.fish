set fish_greeting

if status is-interactive
    if type -q oh-my-posh
        oh-my-posh init fish --config ~/.config/fish/theme.json | source
    end
end

set -g -x SHELL (which fish)
set -g -x EDITOR nvim
set -g -x GPG_TTY (tty)
set -g -x XZ_OPT -T0
set -gx GOPROXY https://proxy.golang.org/

alias l "exa -la"
alias s "kitty +kitten ssh"
alias pwease doas

# wayland
set -g -x MOZ_ENABLE_WAYLAND 1
set -g -x SDL_VIDEODRIVER wayland
set -g -x _JAVA_AWT_WM_NONREPARENTING 1
set -gx QT_QPA_PLATFORM wayland
set -g -x XDG_CURRENT_DESKTOP sway
set -g -x XDG_CURRENT_SESSION sway
#set WINIT_UNIX_BACKEND x11

# pnpm
set -g -x PNPM_HOME "/home/theo/.local/share/pnpm"
fish_add_path "$PNPM_HOME"

# cmake
set -g -x CPM_SOURCE_CACHE $HOME/.cache/CPM

set -g -x DOCKER_CLI_EXPERIMENTAL enabled
set -g -x CPM_SOURCE_CACHE $HOME/.cache/CPM
set -g -x CPM_USE_LOCAL_PACKAGES true

set PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/shims $PYENV_ROOT/bin $PYENV_ROOT/versions/3.13-dev/bin

fish_add_path /Applications/jdk-24.jdk/Contents/Home/bin /usr/local/bin

set -gx DYLD_LIBRARY_PATH /usr/local/lib
