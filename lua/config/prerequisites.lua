local dependencies = {
    "composer",
    "gcc",
    "lazydocker",
    "lazygit",
    "node",
    "npm",
    "nvr",
    "rg",
}

for index, dependency in pairs(dependencies) do
    if vim.fn.executable(dependency) == 0 then
        error("Missing executable: " .. dependency .. " (" .. index .. ")")
    end
end
