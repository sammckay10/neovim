local colorscheme_file = vim.fn.stdpath("data") .. "/last_colorscheme"

if vim.fn.filereadable(colorscheme_file) == 1 then
    local saved_colorscheme = vim.fn.readfile(colorscheme_file)[1]

    if saved_colorscheme and saved_colorscheme ~= "" then
        pcall(vim.cmd.colorscheme, saved_colorscheme)
    end
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local colorscheme = vim.g.colors_name

        if colorscheme then
            vim.fn.writefile({ colorscheme }, colorscheme_file)
        end
    end,
})
