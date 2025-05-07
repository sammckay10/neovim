-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gf", vim.lsp.buf.code_action)
vim.keymap.set("n", "gi", vim.lsp.buf.hover)
vim.keymap.set("n", "gr", vim.lsp.buf.rename)
vim.keymap.set("n", "gu", vim.lsp.buf.references)

-- Diagnostics
vim.keymap.set("n", "ge", vim.diagnostic.open_float)

-- Comments
vim.keymap.set("n", "<leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<leader>c", "gc", { remap = true })

-- Up and down
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

-- Copy/Paste
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>yy", "\"+yy")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>P", "\"+P")
