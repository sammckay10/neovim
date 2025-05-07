return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
      },
      highlight = { enable = true },
      ignore_install = {},
      modules = {},
      sync_install = false,
    })
  end,
}
