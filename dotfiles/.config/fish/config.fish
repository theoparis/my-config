set fish_greeting

if status is-interactive
	if type -q oh-my-posh
		oh-my-posh init fish --config ~/.config/fish/theme.json | source
	end
end

fish_add_path /usr/local/bin ~/.bun/bin ~/zig/bin ~/.local/bin ~/.cargo/bin ~/.zigmod/bin ~/my-config/scripts/bin ~/go/bin ~/.deno/bin /opt/rocm-5.0.0/hip/bin ~/.local/share/gem/ruby/3.0.0/bin ~/.nimble/bin ~/nim/bin /usr/local/cross/amd64/bin /opt/gradle/bin /opt/maven/bin /opt/prism/bin ~/nodejs/bin /usr/local/musl/bin

set -g -x SHELL (which fish)
set -g -x EDITOR nvim
set -g -x GPG_TTY (tty)
set -g -x PKG_CONFIG_PATH /usr/local/lib/pkgconfig /usr/lib/pkgconfig $HOME/.nix-profile/lib/pkgconfig $PKG_CONFIG_PATH
set -g -x LD_LIBRARY_PATH /usr/lib/jvm/java-20-openjdk/lib /usr/lib/jvm/java-20-openjdk/lib/server /usr/local/lib /usr/local/lib/x86_64-unknown-linux-gnu /usr/lib /usr/lib64 /lib /lib64 
set -g -x LIBRARY_PATH /usr/local/lib /usr/local/lib/x86_64-unknown-linux-gnu /usr/lib /usr/lib64 /lib /lib64 /usr/local/lib/clang/17/lib/linux
set -g -x XZ_OPT "-T0"

alias l "exa -la"
alias s "kitty +kitten ssh"
alias pwease "doas"

# bun
set -g -x BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

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
set -g -x GPG_TTY $(tty)
set -g -x CPM_SOURCE_CACHE $HOME/.cache/CPM
set -g -x CPM_USE_LOCAL_PACKAGES true

set PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/shims $PYENV_ROOT/bin
