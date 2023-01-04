# Nushell Config File
alias l = (ls -la | grid -c)

let-env WASMER_DIR = $"($env.HOME)/.local/share/wasmer"
let-env WASMER_CACE_DIR = $"($env.WASMER_DIR)/cache"

let-env PATH = ($env.PATH 
	| prepend $"($env.HOME)/.local/bin"
	| prepend $"($env.HOME)/.cargo/bin"
	| prepend $"($env.HOME)/go/bin"
	| prepend $"($env.HOME)/.bun/bin"
	| prepend $"($env.WASMER_DIR)/bin"
	| prepend $"($env.HOME)/zig/bin"
	| prepend $"($env.HOME)/nim/bin"
	| prepend $"($env.HOME)/dev/cni-plugins/bin"
	| prepend $"($env.HOME)/nodejs/bin"
)
let-env EDITOR = "nvim"
let-env LANG = "en_US.UTF-8"
let-env MANPAGER = "nvim"

# Prompt
let-env PROMPT_COMMAND = {
    # Zoxide
    ~/.cargo/bin/zoxide add -- (shells | where active == true | get path | get 0)
}

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
let-env HELIX_RUNTIME = "/mnt/data/projects/helix.git/master/runtime"
let-env GPG_TTY = (tty)
let-env RUST_TARGET_PATH = "/mnt/data/share/projects/mustang/mustang/target-specs"

let-env config = {
	show_banner: false
}
