return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
        always_trigger = true,
        floating_window = false,
        hint_prefix = { above = "↙ ", current = "← ", below = "↖ " },
    },
}
