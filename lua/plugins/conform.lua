-- Formatters configuration for conform.nvim
-- Maps file types to their respective formatters
local formatters = {
    ['*'] = { 'squeeze_blanks', 'trim_whitespace', 'trim_newlines' }, -- All files
    lua = { 'stylua' },
    php = { 'pint' },
    blade = { 'blade-formatter' },
}

-- Prettier for these file types
for _, file_type in ipairs({
    'css',
    'html',
    'json',
    'jsonc',
    'scss',
    'svg',
    'xml',
}) do
    formatters[file_type] = { 'prettierd' }
end

-- ESLint & Prettier for these file types
for _, file_type in ipairs({
    'astro',
    'javascript',
    'javascriptreact',
    'svelte',
    'typescript',
    'typescriptreact',
    'vue',
}) do
    formatters[file_type] = { 'eslint_d', 'prettierd' }
end

-- Bash formatting
for _, file_type in ipairs({
    'sh',
    'bash',
}) do
    formatters[file_type] = { 'shfmt' }
end

-- Setup conform with format on save
require('conform').setup({
    formatters_by_ft = formatters,
    format_on_save = function(bufnr)
        if vim.b[bufnr].conform_disable_format_on_save then
            return nil
        end

        return {
            lsp_format = 'fallback',
            timeout_ms = 10000,
        }
    end,
    notify_on_error = true,
})
