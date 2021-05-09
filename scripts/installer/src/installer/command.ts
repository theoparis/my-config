import { ConfigInstaller } from "./index.ts";

export const runCommand = async (
    command: string[],
    cwd: string = Deno.cwd()
) => {
    const cmd = Deno.run({
        cmd: command,
        stdout: "piped",
        cwd: cwd,
        stderr: "piped",
    });

    const output = await cmd.output(); // "piped" must be set

    const outStr = new TextDecoder().decode(output);
    console.log(outStr);
    cmd.close();

    return outStr;
};

export const link = async (
    installer: ConfigInstaller,
    fromFile: string,
    toFile: string
) => {
    try {
        installer.logger.info(`Linking ${fromFile} to ${toFile}...`);
        await Deno.link(fromFile, toFile);
    } catch (err) {
        installer.logger.warn(`Could not create ${toFile}: ${err}`);
    }
};
