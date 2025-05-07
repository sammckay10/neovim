return {
    "RRethy/base16-nvim",
    config = function()
        require("base16-colorscheme").with_config({
            telescope = false,
            indentblankline = false,
            notify = false,
            ts_rainbow = false,
            cmp = false,
            illuminate = false,
            dapui = false,
        })

        -- Overwritten by /lua/config/remember-colourscheme.lua
        vim.cmd.colorscheme("base16-default-dark")
    end,
}
