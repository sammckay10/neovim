local current_mode = ""
local current_git_branch = ""
local current_file_path = ""
local current_lsp_status = ""

local function set_mode()
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

    current_mode = "[" .. (modes[mode] or mode:lower()) .. "]"
end

local function set_git_branch()
    local branch = vim.fn
        .system("git rev-parse --abbrev-ref HEAD 2>/dev/null")
        :gsub("\n", "")

    if branch ~= "" then
        current_git_branch = branch
    else
        current_git_branch = ""
    end
end

local function set_filepath()
    local path = vim.fn.expand("%:~:.")

    if path ~= "" then
        current_file_path = path
    else
        current_file_path = ""
    end
end

local lsp_status_timer = nil

local function set_lsp_status()
    local status = vim.lsp.status()

    if lsp_status_timer then
        lsp_status_timer:stop()
        lsp_status_timer = nil
    end

    if status == "" then
        current_lsp_status = ""
    else
        current_lsp_status = status

        vim.cmd("redrawstatus")

        lsp_status_timer = vim.defer_fn(function()
            current_lsp_status = ""
            lsp_status_timer = nil

            vim.cmd("redrawstatus")
        end, 500)
    end
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "FocusGained" }, {
    callback = function()
        set_git_branch()
        set_filepath()
        set_mode()
    end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
    callback = set_mode,
})

vim.api.nvim_create_autocmd("LspProgress", {
    callback = set_lsp_status,
})

function _G.status_line()
    return "%="
        .. table.concat(
            require("utils.table").remove_empty_strings({
                current_mode,
                current_git_branch,
                current_file_path,
                "%c %l",
                current_lsp_status,
            }),
            " • "
        )
        .. "%="
end

vim.opt.laststatus = 3
vim.o.statusline = "%!v:lua.status_line()"
