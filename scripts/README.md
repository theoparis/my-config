# Theo's Config Scripts

## Requirements

- Linux based OS
- [Neovim nightly version](https://github.com/neovim/neovim/releases/nightly)
- [Starship Prompt](https://starship.rs)
- [ZSH Shell](https://zsh.org)
- [ZPlug](https://github.com/zplug/zplug)
- fzf, tmux & stow

## Initialization

**WARNING:** This could potentionally mess up your existing configuration, so make sure that you have it backed up.

Anyways, first thing you should do is clone the repo like so:

```bash
git clone https://github.com/creepinson/my-config ~/my-config
```

Next, run the init script that will link the config files from the local git repo to the respective config folders.

```
cd ~/my-config
./scripts/init.sh
```

