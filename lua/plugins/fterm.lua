return {
    "numToStr/FTerm.nvim",
    keys = {
        {
            "<C-g>",
            function()
                require("FTerm").scratch({
                    cmd = "lazygit -ucf "
                        .. vim.fn.stdpath("config")
                        .. "/lazygit.config.yml",
                    dimensions = { height = 1, width = 1, x = 0, y = 0 },
                    border = "solid",
                })
            end,
            desc = "Open Lazygit",
        },
        {
            "<C-d>",
            function()
                require("FTerm").scratch({
                    cmd = "lazydocker",
                    dimensions = { height = 1, width = 1, x = 0, y = 0 },
                    border = "solid",
                })
            end,
            desc = "Open Lazydocker",
        },
    },
}
