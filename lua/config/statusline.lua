local lsp_status = ""
local lsp_status_timer = nil

local function set_lsp_status()
    if lsp_status_timer then
        pcall(function()
            lsp_status_timer:close()
        end)
    end

    lsp_status = "%#fg.italic.base04#" .. vim.lsp.status():match("^%s*(.-)%s*$")

    lsp_status_timer = vim.defer_fn(function()
        lsp_status = ""

        vim.cmd("redrawstatus")
    end, 1000)

    vim.cmd("redrawstatus")
end

vim.api.nvim_create_autocmd("LspProgress", {
    callback = set_lsp_status,
})

local function get_mode()
    local mode = vim.api.nvim_get_mode().mode

    local modes = {
        ["n"] = "normal",
        ["no"] = "operation-pending",
        ["v"] = "visual",
        ["V"] = "visual-line",
        ["\22"] = "visual-block",
        ["s"] = "select",
        ["S"] = "select-line",
        ["\19"] = "select-block",
        ["i"] = "insert",
        ["ic"] = "insert",
        ["R"] = "replace",
        ["Rv"] = "visual-replace",
        ["c"] = "command",
        ["cv"] = "vim-execute",
        ["ce"] = "execute",
        ["r"] = "prompt",
        ["rm"] = "more",
        ["r?"] = "confirm",
        ["!"] = "shell",
        ["t"] = "terminal",
    }

    return "%#fg.bold.base0F#" .. "[" .. (modes[mode] or mode:lower()) .. "]"
end

local function get_position()
    return "%#fg.base06#"
        .. "%c"
        .. "%#fg.base04#"
        .. ":"
        .. "%#fg.base06#"
        .. "%l"
end

local function get_path()
    local full_path = vim.api.nvim_buf_get_name(
        vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    )

    if full_path == "" then
        return ""
    end

    local relative_path = vim.fn.fnamemodify(full_path, ":.")

    return "%#fg.base06#" .. relative_path
end

local function get_divider()
    return "%#fg.base04# • "
end

function _G.statusline()
    local is_active = vim.api.nvim_get_current_win() == vim.g.statusline_winid

    if not is_active then
        return get_path()
    end

    return table.concat(
        require("utils.table").remove_empty_strings({
            get_mode(),
            get_position(),
            get_path(),
            lsp_status,
        }),
        get_divider()
    )
end

vim.opt.laststatus = 2
vim.o.statusline = "%!v:lua.statusline()"
