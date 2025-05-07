return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        defaults = {
            file_ignore_patterns = { ".git/" },
        },
        pickers = {
            find_files = {
                hidden = true,
            },
            colorscheme = {
                enable_preview = true,
            },
        },
    },
    keys = {
        { "<C-S-p>", "<cmd>Telescope<CR>" },
        { "<C-p>", "<cmd>Telescope find_files<CR>" },
        { "<C-f>", "<cmd>Telescope live_grep<CR>" },
    },
}
