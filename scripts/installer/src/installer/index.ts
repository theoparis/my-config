import { WriteConfig } from "cfg";
import * as fs from "std/fs/mod.ts";
import * as path from "std/path/mod.ts";
import { PrefixedConsoleLogger } from "../logger/console.ts";
import { getDistroName } from "../sys/mod.ts";
import { link, runCommand } from "./command.ts";
import { Config } from "./config.ts";

export class ConfigInstaller {
    logger: PrefixedConsoleLogger;

    constructor(
        public dir: string,
        public config: WriteConfig<Config>,
        public homeDir = Deno.env.get("HOME")!
    ) {
        this.dir = dir.startsWith("~/")
            ? dir.replace("~/", `${homeDir}/`)
            : dir;
        this.logger = new PrefixedConsoleLogger("Installer");
    }

    async run() {
        const { dotfiles, packages } = this.config.toObject();

        await this.installPackages(packages);
        await this.createDotfiles(dotfiles);
    }

    async createDotfiles(dotfiles: string[]) {
        await fs.ensureDir("~/.config/zsh");

        for await (const dot of dotfiles) {
            if (dot === "zsh") {
                const zshFile = path.join(this.dir, "dotfiles", "zsh", "zshrc");
                try {
                    this.logger.info(
                        `Linking ${zshFile} to ${this.homeDir}/.zshrc...`
                    );
                    await Deno.link(zshFile, `${this.homeDir}/.zshrc`);
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.zshrc: ${err}`
                    );
                }
            } else if (dot === "tmux") {
                const tmuxFile = path.join(this.dir, "dotfiles", "tmux.conf");

                try {
                    this.logger.info(
                        `Linking ${tmuxFile} to ${this.homeDir}/.tmux.conf...`
                    );
                    await Deno.link(tmuxFile, `${this.homeDir}/.tmux.conf`);
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.tmux.conf: ${err}`
                    );
                }
            } else if (dot === "neovim") {
                const vimFile = path.join(this.dir, "dotfiles", "neovim");

                try {
                    this.logger.info(
                        `Linking ${vimFile} to ${this.homeDir}/.config/nvim/...`
                    );
                    await Deno.link(vimFile, `${this.homeDir}/.config/nvim`);
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.config/nvim: ${err}`
                    );
                }
            } else if (dot === "starship") {
                await fs.ensureDir(`${this.homeDir}/.config`);
                const starshipFile = path.join(
                    this.dir,
                    "dotfiles",
                    "starship.toml"
                );

                try {
                    this.logger.info(
                        `Linking ${starshipFile} to ${this.homeDir}/.config/starship.toml...`
                    );
                    await Deno.link(
                        starshipFile,
                        `${this.homeDir}/.config/starship.toml`
                    );
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.config/starship.toml: ${err}`
                    );
                }
            } else if (dot === "alacritty") {
                await link(
                    this,
                    path.join(this.dir, "dotfiles", "alacritty.yml"),
                    path.join(
                        this.homeDir,
                        ".config",
                        "alacritty",
                        "alacritty.yml"
                    )
                );
            }
        }
    }

    async installPackages(packages: string[]) {
        if (packages.length === 0) return;

        const os = this.config.toObject().os || (await getDistroName());

        this.logger.info("Installing packages...");

        for await (const pkg of packages) {
            this.logger.info(`Attempting to install: ${pkg} on ${os}...`);

            if (os === "Ubuntu") {
                await runCommand(["sudo", "apt", "install", "-y", pkg]);
            } else if (
                os === "ArchLinux" ||
                os === "ManjaroLinux" ||
                os === "Artix"
            ) {
                await runCommand(["sudo", "pacman", "-Sy", "--noconfirm", pkg]);
            } else if (os === "MacOS") {
                await runCommand(["brew", "install", pkg]);
            } else {
                this.logger.error(
                    "Unknown Operating System/Distro. Please file an issue on the github repository if you think support for your OS should be added."
                );
            }
        }

        await fs.ensureDir("~/bin");
        await this.installTmuxPlugins();
        await this.installStarship();
        await this.installNode();
        await this.installDesk();
        await this.installPacker();
    }

    protected async installTmuxPlugins() {
        await runCommand([
            "git",
            "clone",
            "https://github.com/tmux-plugins/tpm",
            "~/.tmux/plugins/tpm",
        ]);
        await runCommand(["git", "pull"], "~/.tmux/plugins/tpm");
    }

    protected async installStarship() {
        await runCommand([
            "FORCE=true",
            "sh",
            "-c",
            "$(curl -fsSL https://starship.rs/install.sh)",
        ]);
    }

    protected async installNode() {
        await runCommand([
            "sh",
            "-c",
            "curl https://raw.githubusercontent.com/tj/n/master/bin/n > ~/bin/n && chmod +x ~/bin/n",
        ]);
    }

    protected async installDesk() {
        await runCommand([
            "sh",
            "-c",
            `curl https://raw.githubusercontent.com/jamesob/desk/master/desk > ~/bin/desk &&
            chmod +x ~/bin/desk
            mkdir -p \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/desk
            curl https://raw.githubusercontent.com/jamesob/desk/master/shell_plugins/zsh/desk.plugin.zsh -o \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/desk/desk.plugin.zsh
            `,
        ]);
    }

    protected async installPacker() {
        await runCommand([
            "sh",
            "-c",
            `
            git clone https://github.com/wbthomason/packer.nvim \
            ~/.local/share/nvim/site/pack/packer/start/packer.nvim
            cd  ~/.local/share/nvim/site/pack/packer/start/packer.nvim && git pull
            `,
        ]);
    }
}
