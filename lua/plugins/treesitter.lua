-- Treesitter configuration for syntax highlighting
-- Exit if treesitter cli isn't available yet (installed by mason)
if vim.fn.executable("tree-sitter") == 0 then
    return
end

local treesitter = require("nvim-treesitter")
local treesitter_parsers = require("nvim-treesitter.parsers")

-- List of language parsers to ensure are installed
local ensure_installed = {
    "css",
    "html",
    "javascript",
    "scss",
    "typescript",
}

-- Install ensured_installed parsers
treesitter.install(ensure_installed)

-- Auto-install parsers when opening a new file
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local language = vim.treesitter.language.get_lang(args.match)

        if not language then
            return
        end

        local parser_info = treesitter_parsers[language]

        if not parser_info then
            return
        end

        -- Build list of parsers needed for this file (main + dependencies)
        local parsers_to_load = {
            {
                language = language,
                ok = false,
            },
        }

        if parser_info.requires then
            for _, dep in ipairs(parser_info.requires) do
                table.insert(parsers_to_load, {
                    language = dep,
                    ok = false,
                })
            end
        end

        local all_loaded = true

        -- Try to add each required parser
        for _, p in ipairs(parsers_to_load) do
            local ok, _ = vim.treesitter.language.add(p.language)

            if not ok then
                all_loaded = false
            end
        end

        -- Start treesitter if all parsers loaded, otherwise install missing ones
        if all_loaded then
            vim.treesitter.start()
        else
            vim.schedule(function()
                for _, p in ipairs(parsers_to_load) do
                    treesitter.install({ p.language }):wait(10000)
                end

                vim.treesitter.start()
            end)
        end
    end,
})
