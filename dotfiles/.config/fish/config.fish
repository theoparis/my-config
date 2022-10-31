if status is-interactive
    # Commands to run in interactive sessions can go here
	#starship init fish | source
end

fish_add_path ~/zig ~/.local/bin ~/.cargo/bin ~/.zigmod/bin ~/my-config/scripts/bin ~/go/bin ~/.deno/bin /opt/rocm-5.0.0/hip/bin ~/.local/share/gem/ruby/3.0.0/bin ~/.nimble/bin ~/nim/bin /usr/local/cross/amd64/bin

zoxide init fish | source

set -Ux EDITOR nvim
set -Ux LIB_ICU_PATH "~/webkit-build/lib"
set -Ux GPG_TTY $(tty)
set -Ux CRYSTAL_PATH /mnt/data/projects/crystal/src:lib
set -Ux CRYSTAL_ROOT /mnt/data/projects/crystal

alias l "exa -la"
alias s "kitty +kitten ssh"

# bun
set -Ux BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# wayland
set MOZ_ENABLE_WAYLAND 1
set SDL_VIDEODRIVER wayland
set _JAVA_AWT_WM_NONREPARENTING 1
set QT_QPA_PLATFORM wayland
set XDG_CURRENT_DESKTOP sway
set XDG_CURRENT_SESSION sway

# pnpm
set PNPM_HOME "$HOME/.local/share/pnpm"
set PATH "$PNPM_HOME" $PATH
# pnpm end

# cmake
set CPM_SOURCE_CACHE $HOME/.cache/CPM
set DOCKER_CLI_EXPERIMENTAL enabled
set GPG_TTY $(tty)

direnv hook fish | source
