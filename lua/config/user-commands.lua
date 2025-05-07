-- Remove inactive plugins
vim.api.nvim_create_user_command("PackClean", function()
    local deleted_packages = {}

    for _, package in ipairs(vim.pack.get()) do
        if package.active == false then
            vim.pack.del({ package.spec.name })
            table.insert(deleted_packages, package.spec.name)
        end
    end

    if #deleted_packages > 0 then
        vim.notify("Deleted " .. table.concat(deleted_packages, ", "))
    else
        vim.notify("No packages to delete")
    end
end, {})

-- Update all plugins
vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, {})

-- Print installed treesitter parsers
vim.api.nvim_create_user_command("TSListInstalled", function()
    vim.print(vim.inspect(vim.treesitter.language._complete()))
end, {})

-- Copy the current files relative (cwd) path to system clipboard
vim.api.nvim_create_user_command("CopyRelativePath", function()
    local full_path = vim.fn.expand("%:p")

    if full_path == "" then
        vim.notify("No path to copy", vim.log.levels.ERROR)
        return
    end

    local relative_path = vim.fn.fnamemodify(full_path, ":.")

    vim.fn.setreg("+", relative_path)
    vim.notify("Copied: " .. relative_path)
end, {})

-- Copy the current files absolute path to system clipboard
vim.api.nvim_create_user_command("CopyAbsolutePath", function()
    local full_path = vim.fn.expand("%:p")

    if full_path == "" then
        vim.notify("No path to copy", vim.log.levels.ERROR)
        return
    end

    vim.fn.setreg("+", full_path)
    vim.notify("Copied: " .. full_path)
end, {})

-- Copy the current git branch to system clipboard
vim.api.nvim_create_user_command("CopyGitBranch", function()
    local branch =
        vim.fn.system("git branch --show-current"):match("^%s*(.-)%s*$")

    if string.find(branch, "not a git repository") then
        vim.notify("Not a git repository", vim.log.levels.ERROR)
        return
    end

    vim.fn.setreg("+", branch)
    vim.notify("Copied: " .. branch)
end, {})
