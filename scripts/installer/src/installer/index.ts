import * as fs from "std/fs/mod.ts";
import * as path from "std/path/mod.ts";
import { PrefixedConsoleLogger } from "../logger/console.ts";

export class ConfigInstaller {
    logger: PrefixedConsoleLogger;

    constructor(
        public dir: string,
        public os: string,
        public homeDir = Deno.env.get("HOME"),
    ) {
        this.os = os;
        this.dir = dir.startsWith("~/")
            ? dir.replace("~/", `${homeDir}/`)
            : dir;
        this.logger = new PrefixedConsoleLogger("Installer");
    }

    async createDotfiles(dotfiles: string[]) {
        for await (const dot of dotfiles) {
            if (dot === "zsh") {
                const zshFile = path.join(this.dir, "dotfiles", "zsh", "zshrc");
                try {
                    this.logger.info(
                        `Linking ${zshFile} to ${this.homeDir}/.zshrc...`,
                    );
                    await Deno.link(zshFile, `${this.homeDir}/.zshrc`);
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.zshrc: ${err}`,
                    );
                }
            } else if (dot === "tmux") {
                const tmuxFile = path.join(this.dir, "dotfiles", "tmux.conf");

                try {
                    this.logger.info(
                        `Linking ${tmuxFile} to ${this.homeDir}/.tmux.conf...`,
                    );
                    await Deno.link(tmuxFile, `${this.homeDir}/.tmux.conf`);
                } catch (err) {
                    this.logger.warn(`Could not create ${this.homeDir}/.tmux.conf: ${err}`);
                }
            } else if (dot === "neovim") {
                await fs.ensureDir(`${this.homeDir}/.config/nvim`);
                const vimFile = path.join(this.dir, "dotfiles", "vimrc");

                try {
                    this.logger.info(
                        `Linking ${vimFile} to ${this.homeDir}/.config/nvim/init.vim...`,
                    );
                    await Deno.link(
                        vimFile,
                        `${this.homeDir}/.config/nvim/init.vim`,
                    );
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.config/nvim/init.vim: ${err}`,
                    );
                }
                this.logger.info("Installing vim-plug...");
                await this._installNeovimPlug();
            } else if (dot === "coc") {
                await fs.ensureDir(`${this.homeDir}/.config/nvim`);
                const cocFile = path.join(
                    this.dir,
                    "dotfiles",
                    "coc-settings.json",
                );

                try {
                    this.logger.info(
                        `Linking ${cocFile} to ${this.homeDir}/.config/nvim/coc-settings.json...`,
                    );
                    await Deno.link(
                        cocFile,
                        `${this.homeDir}/.config/nvim/coc-settings.json`,
                    );
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.config/nvim/coc-settings.json: ${err}`,
                    );
                }
            } else if (dot === "starship") {
                await fs.ensureDir(`${this.homeDir}/.config`);
                const starshipFile = path.join(
                    this.dir,
                    "dotfiles",
                    "starship.toml",
                );

                try {
                    this.logger.info(
                        `Linking ${starshipFile} to ${this.homeDir}/.config/starship.toml...`,
                    );
                    await Deno.link(
                        starshipFile,
                        `${this.homeDir}/.config/starship.toml`,
                    );
                } catch (err) {
                    this.logger.warn(
                        `Could not create ${this.homeDir}/.config/starship.toml: ${err}`,
                    );
                }
            }
        }
    }

    protected async _installNeovimPlug() {
        const cmd = Deno.run({
            cmd: [
                "sh",
                "-c",
                `'curl -fLo "\${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`,
            ],
            stdout: "piped",
            stderr: "piped",
        });

        const output = await cmd.output(); // "piped" must be set

        const outStr = new TextDecoder().decode(output);
        console.log(outStr);
        cmd.close();

        return outStr;
    }

    async installPackages(packages: string[]) {
        if (packages.length === 0) return;
        this.logger.info("Installing packages...");

        for await (const pkg of packages) {
            this.logger.info(`Attempting to install: ${pkg} on ${this.os}...`);

            if (this.os === "Ubuntu") {
                await this._runPkgCmd(
                    ["sudo", "apt", "install", "-y"],
                    pkg,
                );
            } else if (this.os === "ArchLinux" || this.os === "ManjaroLinux") {
                await this._runPkgCmd(
                    ["yay", "-S", "--noconfirm"],
                    pkg,
                );
            } else if (this.os === "MacOS") {
                await this._runPkgCmd(["brew", "install"], pkg);
            } else {
                this.logger.error(
                    "Unknown Operating System/Distro. Please file an issue on the github repository if you think support for your OS should be added.",
                );
            }
        }
    }

    protected async _runPkgCmd(pkgManager: string[], pkg: string) {
        const cmd = Deno.run({
            cmd: [...pkgManager, pkg],
            stdout: "piped",
            stderr: "piped",
        });

        const output = await cmd.output(); // "piped" must be set

        const outStr = new TextDecoder().decode(output);
        console.log(outStr);
        cmd.close();

        return outStr;
    }
}
