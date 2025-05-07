-- Formatters configuration for conform.nvim
-- Maps file types to their respective formatters
local formatters = {
    ["*"] = { "squeeze_blanks", "trim_whitespace", "trim_newlines" },  -- All files
    lua = { "stylua" },
    php = { "pint" },
    blade = { "blade-formatter" },
}

-- Prettier for these file types
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

-- ESLint + Prettier for JavaScript/TypeScript frameworks
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

-- Setup conform with format on save
require("conform").setup({
    formatters_by_ft = formatters,
    format_on_save = {
        lsp_format = "fallback",
        timeout_ms = 10000,
    },
    notify_on_error = true,
})
