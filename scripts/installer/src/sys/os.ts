export const getLinuxRelease = async () => {
    const cmd = Deno.run({
        cmd: ["lsb_release", "-a"],
        stdout: "piped",
        stderr: "piped",
    });

    const output = await cmd.output(); // "piped" must be set
    const outStr = new TextDecoder().decode(output);

    cmd.close();
    const rawInfo = outStr.split("\n").map((s) => s && s.split(":")).map(s =>
        s[1]
    )
        .map(s => s && s.trim());
    // console.log(rawInfo);
    if (rawInfo) {
        return {
            DistributorID: rawInfo[1],
            Description: rawInfo[2],
            Release: rawInfo[3],
            Codename: rawInfo[4],
        };
    } else return undefined;
};

/**
 * 
 * @returns The OS distro such as Manjaro Linux, Arch Linux, Ubuntu, MacOS.
 * If it cannot be determined, the result is "Unknown".
 */
export const getDistroName = async (): Promise<string> => {
    if (Deno.build.os === "darwin") {
        return "MacOS";
    } else if (Deno.build.os === "linux") {
        const info = await getLinuxRelease();
        if (info) {
            return (info.DistributorID);
        }
    } else if (Deno.build.os === "windows") {
        return "Microsoft Windows";
    }

    return "Unknown";
};
