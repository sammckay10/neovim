return {
  "EdenEast/nightfox.nvim",
  config = function()
    -- https://github.com/EdenEast/nightfox.nvim?tab=readme-ov-file#configuration

    require("nightfox").setup({
      options = {
        transparent = false,
        styles = {
          comments = "italic",
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },
      },
    })

    vim.cmd.colorscheme("nightfox")
  end,
}
