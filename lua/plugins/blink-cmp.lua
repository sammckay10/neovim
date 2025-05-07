-- Blink.cmp completion plugin configuration
require("blink.cmp").setup({
    -- Use rust implementation for fuzzy matching (faster)
    fuzzy = {
        implementation = "prefer_rust",
    },
    -- Configure completion sources
    sources = {
        default = {
            "lsp",
            "path",
        },
    },
    -- Completion list and menu settings
    completion = {
        list = {
            selection = {
                preselect = false,
            },
        },
        menu = {
            border = "none",
            draw = {
                align_to = "none",
                columns = {
                    {
                        "kind_icon",
                        "label",
                        gap = 1,
                    },
                },
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            window = {
                border = "none",
            },
        },
    },
    -- Disable built-in signature help (handled by lsp-signature)
    signature = {
        enabled = false,
    },
    -- Enable cmdline completion
    cmdline = {
        enabled = true,
    },
    -- Keybindings for completion navigation
    keymap = {
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Enter>"] = { "accept", "fallback" },
    },
})
