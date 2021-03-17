import { Command } from "cli/command/mod.ts";
import { Checkbox, prompt } from "cli/prompt/mod.ts";
import { ConfigInstaller } from "./installer/index.ts";
import { getDistroName } from "./sys/mod.ts";

(async () => {
    const { options } = await new Command<
        { packages: boolean; dotfiles: boolean; installDir: string }
    >()
        .name("my-config")
        .version("0.0.1")
        .description("Command line tool to gfor Denoenerate dotfiles")
        .option(
            "-p, --packages <val>",
            "Install system packages such as zsh",
            { default: false },
        )
        .option(
            "-d, --dotfiles <val>",
            "Generate dotfiles such as .tmux.conf",
            { default: false },
        )
        .option(
            "-dir, --install-dir <path>",
            "Specify installation directory, defaults to ~/my-config",
            { default: "~/my-config" },
        )
        .parse(Deno.args);
    // console.log(options);
    const installer = new ConfigInstaller(options.installDir, await getDistroName());

    if (options.packages) {
        const packages = [
            "zsh",
            "tmux",
            "fzf",
            "neovim",
        ];

        const result = await prompt([{
            name: "packages",
            message: "Choose packages to install: ",
            type: Checkbox,
            options: packages,
            default: packages,
        }]);

        await installer.installPackages(result.packages || []);
    }

    if (options.dotfiles) {
        // TODO: more in-depth prompts to enable/disable specific features
        const dotfiles = [
            "zsh",
            "tmux",
            "neovim",
            "coc",
            "starship",
        ];

        const result = await prompt([{
            name: "dotfiles",
            message: "Choose packages to install: ",
            type: Checkbox,
            options: dotfiles,
            default: dotfiles,
        }]);

        await installer.createDotfiles(result.dotfiles || []);
    }

    installer.logger.info("Done.");
})();
