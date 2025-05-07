--- Cron-like scheduling utilities
local M = {}

local PERIODS = {
    minutely = { file = "cron_minutely.txt", interval = 60 },
    hourly = { file = "cron_hourly.txt", interval = 3600 },
    daily = { file = "cron_daily.txt", interval = 86400 },
    weekly = { file = "cron_weekly.txt", interval = 604800 },
    monthly = { file = "cron_monthly.txt", interval = 2592000 },
}

--- Get storage file path for a period
---
--- @param period string
--- @return string
local function get_path(period)
    return vim.fn.stdpath("data") .. "/" .. PERIODS[period].file
end

--- Validate period exists, error if invalid
---
--- @param period string
--- @return boolean
local function validate_period(period)
    if not period or not PERIODS[period] then
        vim.notify(
            "[cron] Invalid period: " .. tostring(period),
            vim.log.levels.ERROR
        )

        return false
    end

    return true
end

--- Read timestamp from storage, returns nil if missing or corrupted
---
--- @param period string
--- @return number|nil
local function read_timestamp(period)
    local file = io.open(get_path(period), "r")

    if not file then
        return nil
    end

    local content = file:read("*a")

    file:close()

    return content ~= "" and tonumber(content) or nil
end

--- Write current timestamp to storage
---
--- @param period string
local function write_timestamp(period)
    local file = io.open(get_path(period), "w")

    if not file then
        vim.notify("[cron] Failed to write timestamp", vim.log.levels.ERROR)

        return
    end

    file:write(os.time())
    file:close()
end

--- Check if enough time has passed since last run
---
--- @param period string
--- @return boolean
local function has_elapsed(period)
    local last = read_timestamp(period)

    return not last or (os.time() - last) >= PERIODS[period].interval
end

--- Check if task should run based on period
---
--- @param period string: "minutely" | "hourly" | "daily" | "weekly" | "monthly"
--- @return boolean: true if task should run
function M.should_run(period)
    return validate_period(period) and has_elapsed(period)
end

--- Run task if interval has elapsed
---
--- @param period string: "minutely" | "hourly" | "daily" | "weekly" | "monthly"
--- @param task function: the task to run
function M.run(period, task)
    if not validate_period(period) or not has_elapsed(period) then
        return
    end

    local ok, err = pcall(task)

    if not ok then
        vim.notify("[cron] Task failed: " .. err, vim.log.levels.ERROR)

        return
    end

    write_timestamp(period)
end

--- Run task daily
---
--- @param task function: the task to run
M.run_daily = function(task)
    M.run("daily", task)
end

--- Run task hourly
---
--- @param task function: the task to run
M.run_hourly = function(task)
    M.run("hourly", task)
end

--- Run task weekly
---
--- @param task function: the task to run
M.run_weekly = function(task)
    M.run("weekly", task)
end

--- Run task monthly
---
--- @param task function: the task to run
M.run_monthly = function(task)
    M.run("monthly", task)
end

--- Run task minutely
---
--- @param task function: the task to run
M.run_minutely = function(task)
    M.run("minutely", task)
end

--- Reset stored timestamp for a period, forcing next run
---
--- @param period string: "minutely" | "hourly" | "daily" | "weekly" | "monthly"
M.reset = function(period)
    if validate_period(period) then
        os.remove(get_path(period))
    end
end

return M
