local colorscheme_file_path = vim.fn.stdpath("data") .. "/colorscheme"

if vim.fn.filereadable(colorscheme_file_path) == 1 then
    vim.cmd.colorscheme(vim.fn.readfile(colorscheme_file_path)[1])
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.fn.writefile({ vim.g.colors_name }, colorscheme_file_path)

        require("utils.ghostty").sync_ghostty_colorscheme()
    end,
})
