return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      globalstatus = true,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
    sections = {
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
      lualine_x = { "filetype" },
      lualine_y = {
        "branch",
      },
      lualine_z = {},
    },
  },
}
