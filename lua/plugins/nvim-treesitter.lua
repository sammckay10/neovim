return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = {
                "astro",
                "css",
                "html",
                "javascript",
                "lua",
                "scss",
                "svelte",
                "typescript",
                "vue",
            },
            highlight = { enable = true },
            ignore_install = {},
            modules = {},
            sync_install = false,
        })
    end,
}
