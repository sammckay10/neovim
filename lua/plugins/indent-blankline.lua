return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local base16 = require("base16-colorscheme").colors
    local hex = require("utils.hex")

    local colours = {
      base16.base0A,
      base16.base0B,
      base16.base0C,
      base16.base0D,
      base16.base0E,
      base16.base0F,
    }

    for index, colour in ipairs(colours) do
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent" .. index, {
        fg = hex.darken(colour, 0.5),
        nocombine = true,
      })
    end

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
