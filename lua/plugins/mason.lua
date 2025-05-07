-- Mason package manager configuration
-- Installs LSP servers, formatters, and other tools

-- List of tools to ensure are installed
local ensure_installed = {
    -- Other
    "tree-sitter-cli",

    -- Formatting
    "pint",
    "prettierd",
    "stylua",

    -- LSP
    "astro-language-server",
    "css-lsp",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "phpactor",
    "svelte-language-server",
    "tailwindcss-language-server",
    "vtsls",
    "vue-language-server",
}

-- Setup Mason with custom UI
require("mason").setup({
    ui = {
        border = "bold",
        backdrop = 100,
        width = 0.75,
        height = 0.75,
    },
})

-- Install any missing tools on startup
local registry = require("mason-registry")

registry.refresh(function()
    local to_install = {}

    for _, name in ipairs(ensure_installed) do
        if not registry.is_installed(name) then
            table.insert(to_install, name)
        end
    end

    if #to_install == 0 then
        return
    end

    vim.cmd(":MasonInstall " .. table.concat(to_install, " "))
end)
