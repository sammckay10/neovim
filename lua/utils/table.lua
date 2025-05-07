--- Table utility functions
local M = {}

--- Remove empty strings from array
---
--- @param data string[]
--- @return string[]
function M.remove_empty_strings(data)
    local result = {}

    for _, value in ipairs(data) do
        if value ~= "" then
            table.insert(result, value)
        end
    end

    return result
end

--- Merge multiple arrays into one
---
--- @vararg string[]
--- @return string[]
function M.merge(...)
    local result = {}

    for _, t in ipairs({ ... }) do
        for _, v in ipairs(t) do
            table.insert(result, v)
        end
    end

    return result
end

return M
