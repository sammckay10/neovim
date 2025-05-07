-- When a new tab is opened, close the tab and open that buffer in the current tab
vim.api.nvim_create_autocmd("TabNew", {
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.cmd("tabclose")
        vim.api.nvim_win_set_buf(0, bufnr)
    end,
})
