return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        keymap = {
            preset = "enter",
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
        },
        signature = {
            enabled = false,
        },
        completion = {
            list = {
                selection = {
                    auto_insert = true,
                    preselect = false,
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                treesitter_highlighting = true,
                window = {
                    border = "rounded",
                },
            },
            menu = {
                draw = { treesitter = { "lsp" } },
                border = "rounded",
            },
        },
        sources = {
            default = { "lsp", "path" },
        },
    },
}
