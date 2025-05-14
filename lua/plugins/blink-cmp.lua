return {
  "saghen/blink.cmp",
  version = "1.*",
  build = "cargo build --release",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    signature = {
      enabled = true,
      window = {
        show_documentation = true,
        treesitter_highlighting = true,
      },
    },
    completion = {
      list = {
        selection = {
          auto_insert = true,
          preselect = false,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
      },
      menu = {
        draw = { treesitter = { "lsp" } },
      },
    },
    sources = {
      default = { "lsp", "path" },
    },
  },
}
