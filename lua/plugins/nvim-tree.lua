return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    disable_netrw = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      adaptive_size = true,
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
  },
  keys = {
    { "<C-b>", "<cmd>NvimTreeToggle<CR>" },
  },
}
