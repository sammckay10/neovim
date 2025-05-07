local cron = require("utils.cron")

cron.run_daily(function()
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            vim.cmd(":TSUpdate")
            vim.cmd(":MasonUpdate")
            vim.cmd(":PackClean")
            vim.cmd(":PackUpdate")
        end,
    })
end)
