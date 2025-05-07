-- Turn on text wrapping for markdown files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*.md",
    command = "setlocal wrap",
})
