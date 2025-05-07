require("oil").setup({
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
        border = "bold",
    },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<C-b>", function()
    require("oil").toggle_float(vim.fn.getcwd())
end)

vim.keymap.set("n", "<C-S-b>", function()
    require("oil").toggle_float()
end)

vim.keymap.set("n", "<C-S-n>", function()
    require("oil").toggle_float(vim.env.HOME .. "/Notes")
end)
