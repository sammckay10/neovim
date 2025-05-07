local colors = require("base16-colorscheme").colors
local darken = require("utils.hex").darken

vim.api.nvim_set_hl(0, "WinSeparator", { fg = darken(colors.base0D, 0.5) })
