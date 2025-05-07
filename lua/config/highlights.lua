local M = {}

local function hl(group_name)
    return vim.api.nvim_get_hl(0, { name = group_name })
end

function M.set_highlights()
    local highlights = {
        -- Split border
        { "WinSeparator", { fg = hl("CursorColumn").bg } },

        -- Status line
        { "StatusLine", { fg = hl("Comment").fg, bg = hl("CursorColumn").bg } },

        -- Blink CMP
        { "BlinkCmpMenu", { bg = hl("Normal").bg } },
        { "BlinkCmpMenuBorder", { link = "BlinkCmpMenu" } },
        { "BlinkCmpKind", { link = "BlinkCmpMenu" } },
    }

    for _, highlight in ipairs(highlights) do
        vim.api.nvim_set_hl(0, highlight[1], highlight[2])
    end
end

M.set_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = M.set_highlights,
})

return M
