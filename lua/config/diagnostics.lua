local colors = require("base16-colorscheme").colors
local darken = require("utils.hex").darken

vim.api.nvim_set_hl(0, "HintBg", { bg = darken(colors.base0B, 0.75) }) -- green
vim.api.nvim_set_hl(0, "InfoBg", { bg = darken(colors.base0D, 0.75) }) --blue
vim.api.nvim_set_hl(0, "WarnBg", { bg = darken(colors.base0A, 0.75) }) -- yellow
vim.api.nvim_set_hl(0, "ErrorBg", { bg = darken(colors.base08, 0.75) }) -- red

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.ERROR] = "",
    },
    linehl = {
      [vim.diagnostic.severity.HINT] = "HintBg",
      [vim.diagnostic.severity.INFO] = "InfoBg",
      [vim.diagnostic.severity.WARN] = "WarnBg",
      [vim.diagnostic.severity.ERROR] = "ErrorBg",
    },
  },
})
