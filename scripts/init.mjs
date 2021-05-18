#!/usr/bin/env zx

const args = argv
    .scriptName("installer")
    .option("root", {
        alias: "r",
        desc: "The root directory to initialize the configuration in.",
        type: "string",
        default: `${os.homedir()}/my-config`
    }).help().parse();

console.log(`Attempting to initialize config from: ${args.root}`);


