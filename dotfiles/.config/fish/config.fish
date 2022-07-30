if status is-interactive
    # Commands to run in interactive sessions can go here
	#starship init fish | source
end

source ~/.asdf/asdf.fish

fish_add_path ~/zig ~/.local/bin ~/.cargo/bin ~/.zigmod/bin ~/my-config/scripts/bin ~/go/bin

zoxide init fish | source

set -Ux EDITOR nvim
set -Ux LIB_ICU_PATH "~/webkit-build/lib"
set -Ux GPG_TTY $(tty)

alias l "exa -la"

# bun
set -Ux BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# wayland
set -Ux MOZ_ENABLE_WAYLAND 1

