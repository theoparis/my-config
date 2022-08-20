if status is-interactive
    # Commands to run in interactive sessions can go here
	#starship init fish | source
end

source ~/.asdf/asdf.fish

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
set -Ux MOZ_ENABLE_WAYLAND 1

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# cmake
set -gx CPM_SOURCE_CACHE $HOME/.cache/CPM

direnv hook fish | source
