-- LSP Signature configuration for function signature hints
require("lsp_signature").setup({
    -- Always show signature hint
    always_trigger = true,
    -- Disable floating window (use virtual text instead)
    floating_window = false,
    -- Hint prefix indicators
    hint_prefix = { above = "↙ ", current = "← ", below = "↖ " },
})
