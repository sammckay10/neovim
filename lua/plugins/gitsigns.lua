-- GitSigns configuration for git gutter and blame
require("gitsigns").setup({
    -- Enable line-by-line git blame
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "right_align",
    },
    -- Signs for git changes in the gutter
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
    -- Signs for staged changes
    signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
    },
})
