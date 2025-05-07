return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["*"] = { "squeeze_blanks", "trim_whitespace", "trim_newlines" },

      lua = { "stylua" },
      php = { "pint" },

      json = { "prettierd" },
      jsonc = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      html = { "prettierd" },
      xml = { "prettierd" },
      svg = { "prettierd" },

      javascript = { "eslint_d", "prettierd" },
      typescript = { "eslint_d", "prettierd" },
      javascriptreact = { "eslint_d", "prettierd" },
      typescriptreact = { "eslint_d", "prettierd" },
      astro = { "eslint_d", "prettierd" },
      svelte = { "eslint_d", "prettierd" },
      vue = { "eslint_d", "prettierd" },

      -- php = function(bufnr)
      -- 	-- Run LSP formatter first
      -- 	vim.lsp.buf.format({ bufnr = bufnr })
      -- 	return { "pint" }
      -- end,
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    notify_on_error = true,
  },
}
