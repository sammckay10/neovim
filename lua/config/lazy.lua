local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(path) then
    local output = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        path,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { output, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()

        os.exit(1)
    end
end

vim.opt.rtp:prepend(path)

require("lazy").setup({
    spec = {
        {
            import = "plugins",
        },
    },
    checker = {
        enabled = true,
        frequency = 86400, -- check every day
    },
    ui = {
        size = { width = 0.75, height = 0.75 },
        border = "rounded",
        backdrop = 100,
    },
})
