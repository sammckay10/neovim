return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        local hooks = require("ibl.hooks")

        hooks.register(
            hooks.type.HIGHLIGHT_SETUP,
            require("config.highlights").set_highlights
        )

        require("ibl").setup({
            scope = {
                enabled = false,
            },
            indent = {
                char = "┇",
                highlight = {
                    "IndentBlanklineIndent1",
                    "IndentBlanklineIndent2",
                    "IndentBlanklineIndent3",
                    "IndentBlanklineIndent4",
                    "IndentBlanklineIndent5",
                    "IndentBlanklineIndent6",
                },
            },
        })
    end,
}
