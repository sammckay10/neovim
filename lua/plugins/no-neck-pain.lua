return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    width = 120,
    autocmds = {
      enableOnVimEnter = true,
      enableOnTabEnter = true,
      reloadOnColorSchemeChange = true,
      skipEnteringNoNeckPainBuffer = false,
    },
  },
}
