vim.api.nvim_set_hl(0, "ErrorBg", { bg = "#2e1e2e" })
vim.api.nvim_set_hl(0, "WarnBg", { bg = "#2e2a1e" })
vim.api.nvim_set_hl(0, "InfoBg", { bg = "#1e3e3a" })
vim.api.nvim_set_hl(0, "HintBg", { bg = "#1e2a3e" })

vim.diagnostic.config({
  signs = {
    linehl = {
      [vim.diagnostic.severity.ERROR] = "ErrorBg",
      [vim.diagnostic.severity.WARN] = "WarnBg",
      [vim.diagnostic.severity.INFO] = "InfoBg",
      [vim.diagnostic.severity.HINT] = "HintBg",
    },
  },
})
