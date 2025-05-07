return {
    "echasnovski/mini.pairs",
    version = "*",
    event = "InsertEnter",
    config = function()
        require("mini.pairs").setup({
            mappings = {
                ["<"] = {
                    action = "open",
                    pair = "<>",
                    neigh_pattern = "[^\\].",
                },
                [">"] = {
                    action = "close",
                    pair = "<>",
                    neigh_pattern = "[^\\].",
                },
            },
        })
    end,
}
