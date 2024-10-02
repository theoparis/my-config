# Nushell Environment Config File

def create_left_prompt [] {
	let path_segment = if (is-admin) {
		$"(ansi red_bold)($env.PWD)"
	} else {
		$"(ansi green_bold)($env.PWD)"
	}

	$path_segment
}

def create_right_prompt [] {
	let time_segment = ([
		(date now | format date '%m/%d/%Y %r')
	] | str join)

	$time_segment
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = { || create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = { || "〉" }
$env.PROMPT_INDICATOR_VI_INSERT = { || ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = { || "〉" }
$env.PROMPT_MULTILINE_INDICATOR = { || "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
	from_string: { |s| $s | split row (char esep) | path expand -n }
	to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
	from_string: { |s| $s | split row (char esep) | path expand -n }
	to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
	($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
	($nu.config-path | path dirname | path join 'plugins')
]
 
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.cargo/bin")
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/src/rustpython/target/release")
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.local/bin")
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.deno/bin")
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.nix-profile/bin")
$env.PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/src/llvm-project/out/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/nix/store/k4m31q5ralky3z58b37jsr8hlc4ccarj-lix-2.91.0/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/usr/lib/llvm-20/bin")

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

$env.GPG_TTY = (tty | str trim)
$env.NINJA_STATUS_MAX_COMMANDS = "8"
