local M = {}

local colors = require("base16-colorscheme").colors
local darken = require("utils.hex").darken

function M.setHightlights()
  local highlights = {
    -- Split border
    { "WinSeparator", { fg = darken(colors.base0D, 0.25) } },

    -- Diagnostics
    { "DiagnosticHintBg", { bg = darken(colors.base0B, 0.75) } },
    { "DiagnosticInfoBg", { bg = darken(colors.base0D, 0.75) } },
    { "DiagnosticWarnBg", { bg = darken(colors.base0A, 0.75) } },
    { "DiagnosticErrorBg", { bg = darken(colors.base08, 0.75) } },

    -- Indent blankline
    { "IndentBlanklineIndent1", { fg = darken(colors.base0A, 0.5) } },
    { "IndentBlanklineIndent2", { fg = darken(colors.base0B, 0.5) } },
    { "IndentBlanklineIndent3", { fg = darken(colors.base0C, 0.5) } },
    { "IndentBlanklineIndent4", { fg = darken(colors.base0D, 0.5) } },
    { "IndentBlanklineIndent5", { fg = darken(colors.base0E, 0.5) } },
    { "IndentBlanklineIndent6", { fg = darken(colors.base0F, 0.5) } },
  }

  for _, highlight in ipairs(highlights) do
    vim.api.nvim_set_hl(0, highlight[1], highlight[2])
  end
end

M.setHightlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = M.setHightlights,
})

return M
