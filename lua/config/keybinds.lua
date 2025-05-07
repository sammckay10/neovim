local terminals = require("utils.terminals")

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gf", vim.lsp.buf.code_action)
vim.keymap.set("n", "gi", vim.lsp.buf.hover)
vim.keymap.set("n", "gr", vim.lsp.buf.rename)
vim.keymap.set("n", "gu", vim.lsp.buf.references)
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help)

-- Diagnostics
vim.keymap.set("n", "ge", vim.diagnostic.open_float)

-- Comments
vim.keymap.set("n", "<leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<leader>c", "gc", { remap = true })

-- Up and down
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

-- System copy/paste
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>yy", "\"+yy")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")

-- Jump to last visible line in buffer
vim.keymap.set("n", "<C-j>", function()
    local old_scrollof_value = vim.o.scrolloff
    vim.o.scrolloff = 0
    vim.cmd("normal! Lzz")
    vim.o.scrolloff = old_scrollof_value
end)

-- Jump to first visible line in buffer
vim.keymap.set("n", "<C-k>", function()
    local old_scrollof_value = vim.o.scrolloff
    vim.o.scrolloff = 0
    vim.cmd("normal! Hzz")
    vim.o.scrolloff = old_scrollof_value
end)

-- Open LazyGit in a floating window
vim.keymap.set("n", "<C-g>", function()
    terminals.run_terminal_app(
        "lazygit -ucf " .. vim.fn.stdpath("config") .. "/lazygit.config.yml"
    )
end)

-- Open LazyDocker in a floating window
vim.keymap.set("n", "<C-d>", function()
    terminals.run_terminal_app("lazydocker")
end)
