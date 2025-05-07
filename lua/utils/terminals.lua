local M = {}

---Runs a terminal application in a fullscreen floating window.
---
---@param cmd string The command to execute (passed to jobstart)
function M.run_terminal_app(cmd)
    local terminal_buffer = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_open_win(terminal_buffer, true, {
        relative = "editor",
        width = vim.o.columns,
        height = vim.o.lines,
        row = 0,
        col = 0,
        border = "none",
    })

    vim.fn.jobstart(cmd, {
        term = true,
        on_exit = function()
            vim.api.nvim_buf_delete(terminal_buffer, { force = true })
        end,
    })

    vim.cmd("startinsert")
end

return M
