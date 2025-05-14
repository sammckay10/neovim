return {
  "nvim-focus/focus.nvim",
  opts = {
    autoresize = {
      minwidth = 20,
      minheight = 10,
    },
  },
  init = function()
    -- Exclude certain file types from auto-resizing
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("FocusDisable", { clear = true }),
      callback = function(_)
        vim.b.focus_disable = vim.tbl_contains({ "NvimTree", "trouble" }, vim.bo.filetype)
      end,
    })
  end,
}
