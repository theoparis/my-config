if status is-interactive
	# Commands to run in interactive sessions can go here
	starship init fish | source
end

fish_add_path ~/.bun/bin ~/zig/bin ~/.local/bin ~/.cargo/bin ~/.zigmod/bin ~/my-config/scripts/bin ~/go/bin ~/.deno/bin /opt/rocm-5.0.0/hip/bin ~/.local/share/gem/ruby/3.0.0/bin ~/.nimble/bin ~/nim/bin /usr/local/cross/amd64/bin /opt/gradle/bin /opt/maven/bin /opt/prism/bin ~/nodejs/bin /src/sysroot/bin

set -Ux EDITOR nvim
set -Ux LIB_ICU_PATH "$HOME/webkit-build/lib"
set -Ux GPG_TTY $(tty)
set -Ux CRYSTAL_PATH /mnt/data/projects/crystal/src:lib
set -Ux CRYSTAL_ROOT /mnt/data/projects/crystal
set -Ux PKG_CONFIG_PATH /usr/local/lib/pkgconfig /usr/lib/pkgconfig $PKG_CONFIG_PATH
set -Ux LD_LIBRARY_PATH /usr/local/lib /usr/lib /usr/lib64 /lib /lib64 /src/sysroot/lib /src/sysroot/lib/x86_64-unknown-linux-gnu
set -Ux XZ_OPT "-T0"

alias l "exa -la"
alias s "kitty +kitten ssh"
alias pwease "doas"

# bun
set -Ux BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# wayland
set -Ux MOZ_ENABLE_WAYLAND 1
set -Ux SDL_VIDEODRIVER wayland
set -Ux _JAVA_AWT_WM_NONREPARENTING 1
set -gx QT_QPA_PLATFORM wayland
set -Ux XDG_CURRENT_DESKTOP sway
set -Ux XDG_CURRENT_SESSION sway
#set WINIT_UNIX_BACKEND x11

# pnpm
set -Ux PNPM_HOME "/home/theo/.local/share/pnpm"
set -Ux PATH "$PNPM_HOME" $PATH

# cmake
set -Ux CPM_SOURCE_CACHE $HOME/.cache/CPM

set -Ux DOCKER_CLI_EXPERIMENTAL enabled
set -Ux GPG_TTY $(tty)
set -Ux CPM_SOURCE_CACHE $HOME/.cache/CPM
set -Ux CPM_USE_LOCAL_PACKAGES true

#direnv hook fish | source
