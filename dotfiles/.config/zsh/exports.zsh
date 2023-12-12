#!/bin/zsh
# Exports
export USER_ID=$(id -u)
export KUBECONFIG="$HOME/.kube/config"
export GOPATH=$HOME/go
export GLFW_IM_MODULE=none
export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64:$HOME/.nix-profile/lib:$LD_LIBRARY_PATH"
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$JAVA_HOME/bin:/usr/local/gradle/bin:$HOME/.nix-profile/bin:$HOME/dev/kotlin-language-server/server/build/install/server/bin:/usr/local/dev/gradle/bin:/usr/local/dev/blender:/usr/local/dev/jdtls/bin:/mnt/data/projects/mvn/bin:$HOME/.bun/bin:$HOME/.cache/.bun/bin:/usr/local/bin:/usr/local/dev/python/bin:/usr/local/bin:$HOME/my-config/scripts/bin:/usr/local/go/bin:/opt/riscv/bin:$HOME/.ops/bin:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.deno/bin:$HOME/sdk/go/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.gem/ruby/3.0.0/bin:$HOME/.nimble/bin:$HOME/.local/bin:$HOME/.n/bin:$HOME/.krew/bin:$HOME/.dotnet/tools:$HOME/.fnm:/opt/rocm/bin:/opt/rocm/hip/bin:/opt/cuda/bin:$HOME/.cargo/bin:$HOME/.bun/bin:/usr/local/cross/bin:$HOME/crystal/bin:$HOME/zig:$HOME/blender:$HOME/dotnet:/opt/pyston/bin:$HOME/godot:$HOME/.ghcup/bin:$HOME/.cabal/bin:$HOME/lua-language-server/bin:$HOME/ungoogled-chromium:/usr/local/dev/lua-lsp/bin:$HOME/Downloads/Discord:$HOME/.local/share/pnpm:/usr/local/blender:$HOME/maven/bin:$HOME/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin:$HOME/.pyenv/versions/3.11.7/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="alacritty"
export NVM_DIR="$HOME/.nvm"
export SXHKD_SHELL="$SHELL"
export PATH="$PATH:$JAVA_HOME/bin"

export MAVEN_OPTS="-XX:+UseZGC -XX:+ZGenerational"

if [ -e "$HOME/.nix-defexpr/channels" ]; then
    export NIX_PATH="$HOME/.nix-defexpr/channels${NIX_PATH:+:$NIX_PATH}"
fi

# Projects Folder For Quick Navigation
export DEV_FOLDER="$HOME/dev"

# Node version mamager (https://github.com/tj/n)
export N_PREFIX="$HOME/.n"

export GTK_THEME="Sweet-Dark"
export WLR_NO_HARDWARE_CURSORS=1
export _JAVA_AWT_WM_NONREPARTENTING=1

# Wayland-specific
export MOZ_DBUS_REMOTE=1
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export QT_QPA_PLATFORMTHEME="qt6ct"
export MOZ_ENABLE_WAYLAND=1
export GDK_BACKEND=wayland
export MOZ_DISABLE_RDD_SANDBOX=1

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/dev/obs/lib/pkgconfig:/usr/local/dev/python/lib/pkgconfig:$PKG_CONFIG_PATH"

# CPM.cmake
export CPM_SOURCE_CACHE=$HOME/.cache/CPM

export VULKAN_SDK="/usr"
export HELIX_RUNTIME="$HOME/dev/helix/runtime"
export RUSTPYTHONPATH="/usr/local/dev/rustpython/Lib"

export XDG_RUNTIME_DIR="/run/user/$(id -u)"

