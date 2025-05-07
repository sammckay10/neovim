-- Ensure depencies are available
for index, dependency in pairs({
    "composer",
    "curl",
    "gcc",
    "lazydocker",
    "lazygit",
    "node",
    "npm",
    "nvr",
    "rg",
}) do
    if vim.fn.executable(dependency) == 0 then
        error("Missing executable: " .. dependency .. " (" .. index .. ")")
    end
end

-- Ensure directorys are created for notes
vim.fn.mkdir(vim.env.HOME .. "/Notes", "p")
vim.fn.mkdir(vim.env.HOME .. "/Notes/.archive", "p")
