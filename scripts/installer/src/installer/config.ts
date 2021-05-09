import * as z from "https://esm.sh/zod@alpha";

export const configSchema = z.object({
    os: z.string().optional(),
    packages: z.array(z.string()).default([
        "zsh",
        "tmux",
        "fzf",
        "neovim",
        "git",
    ]),
    dotfiles: z.array(z.string()).default([
        "zsh",
        "tmux",
        "neovim",
        "starship",
        "alacritty"
    ]), // TODO: more options such as vim plugins
});

export type Config = z.infer<typeof configSchema>;
