local gh = "https://github.com/"

local plugins = {
    {
        -- required by telescope
        src = gh .. "nvim-lua/plenary.nvim",
    },
    {
        -- required by oil
        src = gh .. "nvim-tree/nvim-web-devicons",
    },
    {
        src = gh .. "RRethy/base16-nvim",
        file = "base16",
    },
    {
        src = gh .. "Saghen/blink.cmp",
        version = vim.version.range("1.*"),
        file = "blink-cmp",
    },
    {
        src = gh .. "stevearc/conform.nvim",
        file = "conform",
    },
    {
        src = gh .. "nvim-focus/focus.nvim",
        file = "focus",
    },
    {
        src = gh .. "lewis6991/gitsigns.nvim",
        file = "gitsigns",
    },
    {
        src = gh .. "ray-x/lsp_signature.nvim",
        file = "lsp-signature",
    },
    {
        src = gh .. "neovim/nvim-lspconfig",
    },
    {
        src = gh .. "mason-org/mason.nvim",
        file = "mason",
    },
    {
        src = gh .. "mason-org/mason-lspconfig.nvim",
        file = "mason-lspconfig",
    },
    {
        src = gh .. "nvim-mini/mini.pairs",
        version = "stable",
        file = "mini-pairs",
    },
    {
        src = gh .. "stevearc/oil.nvim",
        file = "oil",
    },
    {
        src = gh .. "hiphish/rainbow-delimiters.nvim",
        file = "rainbow-delimiters",
    },
    {
        src = gh .. "nvim-telescope/telescope.nvim",
        file = "telescope",
    },
    {
        src = gh .. "nvim-treesitter/nvim-treesitter",
        file = "treesitter",
    },
}

vim.pack.add(plugins)

for _, plugin in ipairs(plugins) do
    if plugin.file ~= nil then
        require("plugins." .. plugin.file)
    end
end
