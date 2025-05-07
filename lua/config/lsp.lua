-- Turn off LSP logging to reduce noise in output
vim.lsp.log.set_level("off")

-- Configure diagnostic display preferences
-- Enable underlines for diagnostics, disable signs, sort by severity
vim.diagnostic.config({
    underline = true,
    signs = false,
    severity_sort = true,
})

-- Configure lua_ls (Lua language server)
-- Load Neovim runtime files into the Lua workspace library
-- This gives Lua LSP access to Neovim API and stdlib
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

-- Configure vtsls (TypeScript/JavaScript/Vue language server)
-- Enable Vue language support with the Vue TypeScript plugin
vim.lsp.config("vtsls", {
    filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
    },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vim.fn.stdpath("data")
                            .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                        languages = {
                            "vue",
                        },
                        configNamespace = "typescript",
                        enableForWorkspaceTypeScriptVersions = true,
                    },
                },
            },
        },
    },
})
