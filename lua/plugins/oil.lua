return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        view_options = {
            show_hidden = true,
        },
        keymaps = {
            ["<C-p>"] = false,
            ["<C-c>"] = false,
            ["<Esc><Esc>"] = { "actions.close", mode = "n" },
        },
        float = {
            max_width = 0.75,
            max_height = 0.75,
            border = "rounded",
        },
    },
    keys = {
        {
            "<C-b>",
            function()
                require("oil").toggle_float(vim.fn.getcwd())
            end,
            desc = "Open current working directory",
        },
        {
            "<C-S-b>",
            function()
                require("oil").toggle_float()
            end,
            desc = "Open parent directory",
        },
        {
            "<C-S-n>",
            function()
                require("oil").toggle_float(vim.env.HOME .. "/Notes")
            end,
            desc = "Open notes directory",
        },
    },
}
