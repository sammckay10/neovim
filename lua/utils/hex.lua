local M = {}

function M.darken(hex, percent)
    local r = tonumber(hex:sub(2, 3), 16)
    local g = tonumber(hex:sub(4, 5), 16)
    local b = tonumber(hex:sub(6, 7), 16)

    r = math.max(0, math.floor(r * (1 - percent)))
    g = math.max(0, math.floor(g * (1 - percent)))
    b = math.max(0, math.floor(b * (1 - percent)))

    return string.format("#%02x%02x%02x", r, g, b)
end

return M
