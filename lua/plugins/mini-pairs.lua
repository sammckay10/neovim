-- Mini.pairs configuration for auto-pairing characters
require("mini.pairs").setup({
    -- Custom mappings for angle brackets
    mappings = {
        ["<"] = {
            action = "open",
            pair = "<>",
            neigh_pattern = "^[^\\]",
        },
        [">"] = {
            action = "close",
            pair = "<>",
            neigh_pattern = "^[^\\]",
        },
    },
})
