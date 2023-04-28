# Nushell Config File
let-env WASMER_DIR = $"($env.HOME)/.local/share/wasmer"
let-env WASMER_CACE_DIR = $"($env.WASMER_DIR)/cache"
let-env EDITOR = "nvim"
let-env LANG = "en_US.UTF-8"
let-env MANPAGER = "nvim"
let-env SHELL = "/run/current-system/sw/bin/nu"

# Zoxide
zoxide add -- (shells | where active == true | get path | get 0)
		
def-env br [
	--args (-a): string
] {
	let cmd_file = (^mktemp | str trim)
	if ($args | empty?) {
		^broot --outcmd $cmd_file
	} else {
		^broot $args --outcmd $cmd_file
	}
	let-env cmd = ((open $cmd_file) | str trim)
	^rm $cmd_file
	cd ($env.cmd | str replace "cd" "" | str trim)
}

alias l = xplr
alias cat = bat -pp

let-env QT_QPA_PLATFORM = "wayland"
let-env QT_QPA_PLATFORMTHEME = "qt6ct"
let-env HELIX_RUNTIME = $"($env.HOME)/dev/helix/runtime"
let-env GPG_TTY = (tty)
let-env cg_clif_dir = $"($env.HOME)/dev/rustc_codegen_cranelift"

let-env PATH = ($env.PATH 
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
)
let-env LD_LIBRARY_PATH = ($env.LD_LIBRARY_PATH
	| prepend "/usr/local/lib"
)
let-env PKG_CONFIG_PATH = $"($env.HOME)/.nix-profile/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/share/pkgconfig"

let-env config = {
	show_banner: false
}

source ~/.cache/starship/init.nu
