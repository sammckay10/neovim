local notify = require("fidget").notify

local notesDir = vim.env.HOME .. "/Notes"
local archiveDir = notesDir .. "/.archive"

local createDirectoryIfMissing = function(dir)
  if vim.fn.isdirectory(dir) == 1 then
    return
  end

  local result = vim.fn.mkdir(dir, "p")
  if result == 0 then
    notify(dir, vim.log.levels.ERROR, { group = "notes", annote = "Notes - Error Creating Directory" })
  else
    notify(dir, vim.log.levels.INFO, { group = "notes", annote = "Notes - Directory Created" })
  end
end

createDirectoryIfMissing(notesDir)
createDirectoryIfMissing(archiveDir)

local function getSlug(str)
  local slug = str
    :lower()
    :gsub("\n", "")
    :gsub("^%s+", "")
    :gsub("%s+$", "")
    :gsub("[^%w]+", "-")
    :gsub("^%-+", "")
    :gsub("%-+$", "")
    :gsub("%-+", "-")

  return vim.fn.fnameescape(slug)
end

local actions = {}

actions.list = function()
  require("telescope.builtin").find_files({
    cwd = notesDir,
    prompt_title = "Search notes",
    hidden = false,
  })
end

actions.list_archived = function()
  require("telescope.builtin").find_files({
    cwd = archiveDir,
    prompt_title = "Search archived notes",
  })
end

actions.add = function(opts)
  local name = opts.args ~= "" and getSlug(opts.args) or getSlug(vim.fn.input("Name: "))

  if name == "" then
    return
  end

  local path = notesDir .. "/" .. name .. ".md"

  notify(path, vim.log.levels.INFO, { group = "notes", annote = "Note Created" })

  vim.cmd({ cmd = "edit", args = { path } })
  vim.cmd({ cmd = "write" })
end

actions.delete = function()
  require("telescope.builtin").find_files({
    cwd = notesDir,
    hidden = false,
    prompt_title = "Select note to delete",
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local path = require("telescope.actions.state").get_selected_entry().path
        local newPath = archiveDir .. "/" .. vim.fn.fnamemodify(path, ":t")

        require("telescope.actions").close(prompt_bufnr)

        local success, _ = os.rename(path, newPath)

        if success then
          for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(bufnr) and vim.api.nvim_buf_get_name(bufnr) == path then
              vim.api.nvim_buf_delete(bufnr, { force = true })
            end
          end

          notify(newPath, vim.log.levels.INFO, { group = "notes", annote = "Note Archived" })

          return
        end

        notify(path, vim.log.levels.ERROR, { group = "notes", annote = "Error Archiving Note" })
      end)

      return true
    end,
  })
end

vim.api.nvim_create_user_command("Notes", function(opts)
  local subCommand = opts.fargs[1]

  if not subCommand then
    actions.list()
    return
  end

  if actions[subCommand] then
    actions[subCommand]({ args = table.concat(vim.list_slice(opts.fargs, 2), " ") })
    return
  end

  notify(subCommand, vim.log.levels.ERROR, { group = "notes", annote = "Unknown Command" })
end, {
  nargs = "*",
  complete = function()
    return { "add", "delete", "list", "list_archived" }
  end,
})
