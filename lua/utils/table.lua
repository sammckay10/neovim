local M = {}

function M.remove_empty_strings(data)
    local result = {}

    for _, value in ipairs(data) do
        if value ~= "" then
            table.insert(result, value)
        end
    end

    return result
end

return M
