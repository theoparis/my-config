# Nushell Config File
$env.WASMER_DIR = $"($env.HOME)/.local/share/wasmer"
$env.WASMER_CACE_DIR = $"($env.WASMER_DIR)/cache"
$env.EDITOR = "nvim"
$env.LANG = "en_US.UTF-8"
$env.MANPAGER = "nvim"
$env.SHELL = $"($env.HOME)/.cargo/bin/nu"
$env.PNPM_HOME = $"($env.HOME)/.local/share/pnpm"

alias l = xplr
alias cat = bat -pp

$env.QT_QPA_PLATFORM = "wayland"
$env.QT_QPA_PLATFORMTHEME = "qt6ct"
$env.HELIX_RUNTIME = $"($env.HOME)/dev/helix/runtime"
$env.GPG_TTY = (tty)
$env.cg_clif_dir = $"($env.HOME)/dev/rustc_codegen_cranelift"

$env.PATH = ($env.PATH 
	| prepend "/usr/local/bin"
	| prepend $"($env.cg_clif_dir)/dist/bin"
	| append "/run/current-system/sw/bin"
	| append "/run/wrappers/bin"
	| append "/usr/bin"
	| prepend $"($env.HOME)/my-config/scripts/bin"
	| prepend $"($env.HOME)/.local/bin"
	| prepend $"($env.HOME)/.cargo/bin"
	| prepend $"($env.HOME)/go/bin"
	| prepend $"($env.HOME)/.bun/bin"
	| prepend $"($env.WASMER_DIR)/bin"
	| prepend $"($env.HOME)/zig"
	| prepend $"($env.HOME)/nim/bin"
	| prepend $"($env.HOME)/dev/cni-plugins/bin"
	| prepend $"($env.HOME)/nodejs/bin"
	| prepend "/usr/local/bin"
	| prepend $"($env.HOME)/.deno/bin"
	| prepend $"($env.HOME)/.local/share/pnpm"
)
$env.LD_LIBRARY_PATH = (
	"/usr/local/lib"
)
$env.PKG_CONFIG_PATH = $"($env.HOME)/.nix-profile/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/share/pkgconfig:/usr/local/lib64/pkgconfig"

$env.config = {
	show_banner: false
}

# Zoxide
zoxide add -- (shells | where active == true | get path | get 0)
		

use '/home/theo/.config/broot/launcher/nushell/br' *
use ~/.cache/starship/init.nu
