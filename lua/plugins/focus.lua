-- Focus.nvim configuration for automatic window resizing
require("focus").setup({
    -- Minimum window dimensions
    autoresize = {
        minwidth = 40,
        minheight = 10,
    },
    -- UI settings
    ui = {
        signcolumn = false,
    },
})
