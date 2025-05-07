local links = {
    -- Neovim
    StatusLine = "bg.base01",
    StatusLineNC = "bg.base01",
    CursorLine = "bg.base00",
    FloatBorder = "fg.base0F",
    WinSeparator = "fg.base0F",

    -- Telescope
    TelescopeBorder = "fg.base0F",

    -- Blink CMP
    -- https://cmp.saghen.dev/configuration/appearance.html
    BlinkCmpMenu = "bg.base01",
    BlinkCmpMenuSelection = "bg.base03",

    BlinkCmpScrollBarGutter = "bg.base02",
    BlinkCmpScrollBarThumb = "bg.base04",

    BlinkCmpDoc = "bg.base02",
    BlinkCmpDocSeparator = "bg.base02",

    BlinkCmpKindClass = "fg.base09",
    BlinkCmpKindColor = "fg.base0D",
    BlinkCmpKindConstant = "fg.base0C",
    BlinkCmpKindConstructor = "fg.base09",
    BlinkCmpKindEnum = "fg.base0A",
    BlinkCmpKindEnumMember = "fg.base09",
    BlinkCmpKindEvent = "fg.base0A",
    BlinkCmpKindField = "fg.base0C",
    BlinkCmpKindFile = "fg.base0D",
    BlinkCmpKindFolder = "fg.base0B",
    BlinkCmpKindFunction = "fg.base0D",
    BlinkCmpKindInterface = "fg.base0C",
    BlinkCmpKindKeyword = "fg.base0E",
    BlinkCmpKindMethod = "fg.base0B",
    BlinkCmpKindModule = "fg.base0C",
    BlinkCmpKindOperator = "fg.base08",
    BlinkCmpKindProperty = "fg.base0D",
    BlinkCmpKindReference = "fg.base0B",
    BlinkCmpKindSnippet = "fg.base0B",
    BlinkCmpKindStruct = "fg.base09",
    BlinkCmpKindText = "fg.base0A",
    BlinkCmpKindTypeParameter = "fg.base0C",
    BlinkCmpKindUnit = "fg.base0E",
    BlinkCmpKindValue = "fg.base0A",
    BlinkCmpKindVariable = "fg.base0E",
}

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    callback = function()
        for name, link in pairs(links) do
            vim.api.nvim_set_hl(0, name, { link = link })
        end
    end,
})
