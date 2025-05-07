local M = {}

---Sync Neovim's base16 colorscheme to Ghostty terminal
function M.sync_ghostty_colorscheme()
    -- Check if Ghostty config directory exists
    local ghostty_dir = vim.env.HOME .. "/.config/ghostty"
    if vim.fn.isdirectory(ghostty_dir) == 0 then
        return
    end

    -- Load base16 colorscheme
    local colors = require("base16-colorscheme").colors
    if not colors then
        return
    end

    -- Create themes directory if it doesn't exist
    local theme_dir = ghostty_dir .. "/themes"
    vim.fn.mkdir(theme_dir, "p")

    -- Build theme file with base16 colors
    local theme = {
        "palette = 0=" .. colors.base00,
        "palette = 1=" .. colors.base08,
        "palette = 2=" .. colors.base0B,
        "palette = 3=" .. colors.base0A,
        "palette = 4=" .. colors.base0D,
        "palette = 5=" .. colors.base0E,
        "palette = 6=" .. colors.base0C,
        "palette = 7=" .. colors.base07,
        "palette = 8=" .. colors.base01,
        "palette = 9=" .. colors.base09,
        "palette = 10=" .. colors.base0B,
        "palette = 11=" .. colors.base0A,
        "palette = 12=" .. colors.base0D,
        "palette = 13=" .. colors.base0E,
        "palette = 14=" .. colors.base0C,
        "palette = 15=" .. colors.base06,
        "background = " .. colors.base00,
        "foreground = " .. colors.base05,
        "cursor-color = " .. colors.base08,
        "cursor-text = " .. colors.base00,
        "selection-background = " .. colors.base02,
        "selection-foreground = " .. colors.base05,
    }

    -- Write theme file
    if vim.fn.writefile(theme, theme_dir .. "/neovim") == -1 then
        return
    end

    -- Read existing config or create empty table
    local config_path = ghostty_dir .. "/config"
    local config = vim.fn.filereadable(config_path) == 0 and {}
        or vim.fn.readfile(config_path)

    -- Check if theme line already exists
    local has_theme = vim.iter(config):any(function(line)
        return line:match("^theme%s*=")
    end)

    -- Add or update theme line
    if has_theme then
        config = vim.tbl_map(function(line)
            return line:gsub("^theme%s*=.*", "theme = \"neovim\"")
        end, config)
    else
        config[#config + 1] = "theme = \"neovim\""
    end

    -- Write updated config
    vim.fn.writefile(config, config_path)
end

return M
