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
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
