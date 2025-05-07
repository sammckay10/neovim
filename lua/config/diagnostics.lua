vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.ERROR] = "",
        },
        linehl = {
            [vim.diagnostic.severity.HINT] = "DiagnosticHintBg",
            [vim.diagnostic.severity.INFO] = "DiagnosticInfoBg",
            [vim.diagnostic.severity.WARN] = "DiagnosticWarnBg",
            [vim.diagnostic.severity.ERROR] = "DiagnosticErrorBg",
        },
    },
})
