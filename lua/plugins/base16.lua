require("base16-colorscheme").with_config({
    telescope = false,
    indentblankline = false,
    notify = false,
    ts_rainbow = false,
    cmp = false,
    illuminate = false,
    dapui = false,
})

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    callback = function()
        local colors = require("base16-colorscheme").colors

        if not colors then
            return
        end

        for name, hex in pairs(colors) do
            local hl = function(prefix, options)
                vim.api.nvim_set_hl(0, prefix .. "." .. name, options)
            end

            hl("fg", { fg = hex })
            hl("fg.bold", { fg = hex, bold = true })
            hl("fg.italic", { fg = hex, italic = true })
            hl("fg.bold.italic", { fg = hex, bold = true, italic = true })

            hl("bg", { bg = hex })
            hl("bg.bold", { bg = hex, bold = true })
            hl("bg.italic", { bg = hex, italic = true })
            hl("bg.bold.italic", { bg = hex, bold = true, italic = true })
        end
    end,
})
