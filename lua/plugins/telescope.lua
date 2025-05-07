-- Telescope configuration for fuzzy finding
require('telescope').setup({
    -- Default settings
    defaults = {
        file_ignore_patterns = { '.git/' },
        borderchars = { '━', '┃', '━', '┃', '┏', '┓', '┛', '┗' },
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                width = 999,
                height = 999,
                preview_width = 0.5,
            },
            vertical = {
                width = 999,
                height = 999,
                preview_height = 0.5,
            },
        },
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
local pickers = require('telescope.builtin')

-- Keymaps for telescope
-- Fuzzy finder for all vim commands
vim.keymap.set('n', '<C-S-p>', pickers.builtin)
-- Find files in current directory
vim.keymap.set('n', '<C-p>', pickers.find_files)
-- Live grep search
vim.keymap.set('n', '<C-f>', function()
    pickers.live_grep({ additional_args = { '--fixed-strings' } })
end)
-- Replace find in file
vim.keymap.set('n', '<C-/>', pickers.current_buffer_fuzzy_find)
