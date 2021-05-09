import { Command } from "cli/command/mod.ts";
import { Checkbox, prompt } from "cli/prompt/mod.ts";
import { readFile } from "cfg";
import { Config, configSchema } from "./installer/config.ts";
import { ConfigInstaller } from "./installer/index.ts";

(async () => {
    const { options } = await new Command<
        { config: string; installDir: string }
    >()
        .name("my-config")
        .version("0.0.1")
        .description("Command line tool to generatea dotfiles")
        .option(
            "-c, --config <path>",
            "Specify my-config.yaml path",
            { default: "my-config.yaml" },
        )
        .option(
            "-dir, --install-dir <path>",
            "Specify installation directory, defaults to ~/my-config",
            { default: "~/my-config" },
        )
        .option(
            "-o, --only <features>",
            "Only install specific features such as packages/dotfiles",
        )
        .parse(Deno.args);
    // console.log(options);
    const installer = new ConfigInstaller(
        options.installDir,
        readFile<Config>(options.config, { schema: configSchema, type: "yaml" })
            .validate(true),
    );
    await installer.run();

    installer.logger.info("Done.");
})();
