return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  opts = {
    enable_autocmd = false,
  },
  init = function()
    vim.filetype.get_option = function(filetype, option)
      if option ~= "commentstring" then
        return vim.filetype.get_option(filetype, option)
      end

      local calculatedCommentString = require("ts_context_commentstring.internal").calculate_commentstring()

      if calculatedCommentString then
        return calculatedCommentString
      end

      return vim.filetype.get_option(filetype, option)
    end
  end,
}
