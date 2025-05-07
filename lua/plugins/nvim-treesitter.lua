return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      ensure_installed = { 'html', 'javascript', 'css', 'typescript' },
      highlight = { enable = true },
      ignore_install = {},
      modules = {},
      sync_install = false,
    }
  end,
}
