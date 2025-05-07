return {
    "mason-org/mason.nvim",
    opts = {
        ui = {
            border = "rounded",
            backdrop = 100,
            width = 0.75,
            height = 0.75,
        },
    },
    init = function()
        local registry = require("mason-registry")

        local ensure_installed = {
            -- Formatting
            -- "eslint_d",
            "pint",
            "prettierd",
            "stylua",

            -- LSP
            "astro-language-server",
            "css-lsp",
            "emmet-language-server",
            -- "eslint-lsp",
            "html-lsp",
            "json-lsp",
            "lua-language-server",
            "phpactor",
            "svelte-language-server",
            "tailwindcss-language-server",
            "vtsls",
            "vue-language-server",
        }

        registry.refresh(function()
            local to_install = {}

            for _, tool in ipairs(ensure_installed) do
                local package = registry.get_package(tool)

                if not package:is_installed() then
                    table.insert(to_install, { name = tool, package = package })
                end
            end

            if #to_install == 0 then
                return
            end

            vim.notify(
                "Installing the following packages via Mason: "
                    .. table.concat(
                        vim.tbl_map(function(item)
                            return item.name
                        end, to_install),
                        ", "
                    ),
                vim.log.levels.INFO
            )

            for _, tool in ipairs(to_install) do
                tool.package:install()
            end
        end)
    end,
}
