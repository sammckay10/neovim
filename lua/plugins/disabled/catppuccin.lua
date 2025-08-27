return {
  "catppuccin/nvim",
  opts = {
    transparent_background = false,
    default_integrations = false,
    integrations = {
      blink_cmp = true,
      nvimtree = true,
      treesitter = true,
      fidget = true,
      gitsigns = true,
    },
  },
  config = function()
    vim.cmd.colorscheme("catppuccin-frappe")
  end,
}
