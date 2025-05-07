require("telescope").setup({
    defaults = {
        file_ignore_patterns = { ".git/" },
        borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        colorscheme = {
            enable_preview = true,
        },
    },
})

local pickers = require("telescope.builtin")

vim.keymap.set("n", "<C-S-p>", pickers.builtin)
vim.keymap.set("n", "<C-p>", pickers.find_files)
vim.keymap.set("n", "<C-f>", pickers.live_grep)
