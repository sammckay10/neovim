return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.set_log_level("off")

    vim.lsp.config("vtsls", {
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              },
            },
          },
        },
        typescript = {
          preferences = {
            importModuleSpecifier = "non-relative",
          },
        },
      },
    })
  end,
}
