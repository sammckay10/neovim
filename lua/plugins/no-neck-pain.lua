return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    width = 120,
    minSideBufferWidth = 0,
    autocmds = {
      enableOnVimEnter = true,
      enableOnTabEnter = true,
      skipEnteringNoNeckPainBuffer = true,
    },
  },
}
