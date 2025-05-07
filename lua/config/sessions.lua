--- Session management utilities
local M = {}

--- Check if vim was launched with arguments
---
--- @type integer
M.vim_has_arguments = vim.fn.argc()

--- Directory to store sessions
--- @type string
M.sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

--- Create sessions directory if it doesn't exist
M.create_sessions_directory = function()
    if vim.fn.isdirectory(M.sessions_dir) == 0 then
        vim.fn.mkdir(M.sessions_dir, "p")
    end
end

--- Path to current session file
---
--- @type string
M.session_path = M.sessions_dir
    .. string.gsub(vim.fn.getcwd(), "[^%w]", "_")
    .. ".vim"

--- Load session from file if it exists and vim has no arguments
M.load_session = function()
    if M.vim_has_arguments == true then
        return
    end

    if vim.fn.filereadable(M.session_path) == 1 then
        vim.cmd("silent! source " .. M.session_path)
    end
end

--- Save current session to file if vim has no arguments
M.save_session = function()
    if M.vim_has_arguments == true then
        return
    end

    vim.cmd("mksession! " .. M.session_path)
end

M.create_sessions_directory()

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        M.load_session()
    end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        M.save_session()
    end,
})

return M
