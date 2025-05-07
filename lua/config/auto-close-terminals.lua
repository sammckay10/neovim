vim.api.nvim_create_autocmd("TermClose", {
    pattern = "*",
    callback = function(event)
        vim.schedule(function()
            pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
        end)
    end,
})
