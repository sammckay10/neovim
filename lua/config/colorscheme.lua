local colorscheme_file_path = vim.fn.stdpath("data") .. "/colorscheme"

-- If a colorscheme file exists, load it on startup
if vim.fn.filereadable(colorscheme_file_path) == 1 then
    vim.cmd.colorscheme(vim.fn.readfile(colorscheme_file_path)[1])
end

-- Save colorscheme to file and sync with Ghostty whenever it changes
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.fn.writefile({ vim.g.colors_name }, colorscheme_file_path)

        require("utils.ghostty").sync_ghostty_colorscheme()
    end,
})
