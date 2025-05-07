local formatters = {
    ["*"] = { "squeeze_blanks", "trim_whitespace", "trim_newlines" },
    lua = { "stylua" },
    php = { "pint" },
    blade = { "blade-formatter" },
}

for _, fileType in ipairs({
    "css",
    "html",
    "json",
    "jsonc",
    "scss",
    "svg",
    "xml",
}) do
    formatters[fileType] = { "prettierd" }
end

for _, fileType in ipairs({
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "astro",
    "svelte",
    "vue",
}) do
    formatters[fileType] = { "eslint_d", "prettierd" }
end

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = formatters,
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 10000,
        },
        notify_on_error = true,
    },
}
