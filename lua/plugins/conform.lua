local formatters = {
    ["*"] = { "squeeze_blanks", "trim_whitespace", "trim_newlines" },
    lua = { "stylua" },
    php = { "pint" },
    blade = { "blade-formatter" },
}

for _, file_type in ipairs({
    "css",
    "html",
    "json",
    "jsonc",
    "scss",
    "svg",
    "xml",
}) do
    formatters[file_type] = { "prettierd" }
end

for _, file_type in ipairs({
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "astro",
    "svelte",
    "vue",
}) do
    formatters[file_type] = { "eslint_d", "prettierd" }
end

require("conform").setup({
    formatters_by_ft = formatters,
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 10000,
    },
    notify_on_error = true,
})
