return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local base16 = require("base16-colorscheme").colors
    local darken = require("utils.hex").darken
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = darken(base16.base0A, 0.5) })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = darken(base16.base0B, 0.5) })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = darken(base16.base0C, 0.5) })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = darken(base16.base0D, 0.5) })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = darken(base16.base0E, 0.5) })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = darken(base16.base0F, 0.5) })
    end)

    require("ibl").setup({
      scope = {
        enabled = false,
      },
      indent = {
        highlight = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      },
    })
  end,
}
