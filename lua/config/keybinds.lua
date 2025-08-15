-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.rename)
vim.keymap.set("n", "ge", vim.diagnostic.open_float)

-- Comments
vim.keymap.set("n", "<leader>c", "gcc", { remap = true })
vim.keymap.set("v", "<leader>c", "gc", { remap = true })

-- Up and down
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })

-- System copy/paste
vim.keymap.set({ "n", "x" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "x" }, "<leader>p", "\"+p")

-- Force quit all
vim.keymap.set({ "n", "v" }, "<C-x>", ":qa!<CR>", { noremap = true, silent = true })

-- Open Lazygit
vim.keymap.set({ "n" }, "<C-g>", function()
  --- @diagnostic disable-next-line: missing-fields
  require("FTerm").scratch({
    cmd = "lazygit -ucf " .. vim.fn.stdpath("config") .. "/lazygit.config.yml",
    dimensions = {
      height = 1,
      width = 1,
      x = 0,
      y = 0,
    },
    border = "solid", -- :h 'winborder'
  })
end, { noremap = true, silent = true })
