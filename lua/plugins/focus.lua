return {
    "nvim-focus/focus.nvim",
    opts = {
        autoresize = {
            minwidth = 20,
            minheight = 10,
        },
    },
    init = function()
        local ignored_buftypes = {
            "nofile",
            "prompt",
            "popup",
        }

        local ignored_filetypes = {
            "trouble",
        }

        vim.api.nvim_create_autocmd("WinEnter", {
            callback = function()
                if vim.tbl_contains(ignored_buftypes, vim.bo.buftype) then
                    vim.w.focus_disable = true
                else
                    vim.w.focus_disable = false
                end
            end,
            desc = "Disable focus autoresize for BufType",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                if vim.tbl_contains(ignored_filetypes, vim.bo.filetype) then
                    vim.b.focus_disable = true
                else
                    vim.b.focus_disable = false
                end
            end,
            desc = "Disable focus autoresize for FileType",
        })
    end,
}
