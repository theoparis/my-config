#!/usr/bin/env nu
def main [
	--target: string
	--cmd: string
] {
	(cargo +nightly
		$cmd
		-Z build-std=std,core,alloc,panic_abort
		-Z build-std-features=panic_immediate_abort
		--target $target
		--release
	)
}
