-- Oil.nvim configuration for file explorer
require("oil").setup({
    -- Show hidden files in oil
    view_options = {
        show_hidden = true,
    },
    -- Disable default keymaps we don't want
    keymaps = {
        ["<C-p>"] = false,
        ["<C-c>"] = false,
        ["<Esc><Esc>"] = { "actions.close", mode = "n" },
    },
    -- Float window settings
    float = {
        max_width = 0.75,
        max_height = 0.75,
        border = "bold",
    },
})

-- Disable netrw (builtin file explorer) since we're using oil
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Keymaps for oil
-- Toggle oil float for current directory
vim.keymap.set("n", "<C-b>", function()
    require("oil").toggle_float(vim.fn.getcwd())
end)

-- Toggle oil float for directory of current file
vim.keymap.set("n", "<C-S-b>", function()
    require("oil").toggle_float()
end)

-- Toggle oil float for Notes directory
vim.keymap.set("n", "<C-S-n>", function()
    require("oil").toggle_float(vim.env.HOME .. "/Notes")
end)
