return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["<C-p>"] = false,
      ["<C-c>"] = false,
      ["<C-b>"] = { "actions.close", mode = "n" },
    },
  },
  keys = {
    { "<C-b>", "<cmd>Oil<CR>", desc = "Open parent directory" },
  },
}
