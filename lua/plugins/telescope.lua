-- Telescope configuration for fuzzy finding
require("telescope").setup({
    -- Default settings
    defaults = {
        file_ignore_patterns = { ".git/" },
        borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
    },
    -- Custom picker settings
    pickers = {
        find_files = {
            hidden = true,
        },
        colorscheme = {
            enable_preview = true,
        },
    },
})

-- Load telescope builtin pickers
local pickers = require("telescope.builtin")

-- Keymaps for telescope
-- Fuzzy finder for all vim commands
vim.keymap.set("n", "<C-S-p>", pickers.builtin)
-- Find files in current directory
vim.keymap.set("n", "<C-p>", pickers.find_files)
-- Live grep search
vim.keymap.set("n", "<C-f>", pickers.live_grep)
