require("blink.cmp").setup({
    fuzzy = {
        implementation = "prefer_rust",
    },
    sources = {
        default = {
            "lsp",
            "path",
        },
    },
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
    signature = {
        enabled = false,
    },
    cmdline = {
        enabled = true,
    },
    keymap = {
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Enter>"] = { "accept", "fallback" },
    },
})
