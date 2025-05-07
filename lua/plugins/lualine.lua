local branch_widget = { "branch", icon = "󰊢" }

local clock_widget = {
  function()
    return os.date("%H:%M")
  end,
  icon = "󰥔",
}

local diagnostics_widget = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  colored = true,
  update_in_insert = false,
  always_visible = false,
}

local filepath_widget = { "filename", path = 1, icon = "󰈔" }

local mode_widget = {
  "mode",
  icon = "",
  fmt = function(value)
    return value:lower()
  end,
}

local recording_widget = {
  function()
    local recordingKey = vim.fn.reg_recording()
    if recordingKey ~= "" then
      return "recording @" .. recordingKey
    end
    return ""
  end,
  color = { fg = "#ff0000" },
  cond = function()
    return vim.fn.reg_recording() ~= ""
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      globalstatus = true,
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        mode_widget,
      },
      lualine_b = {
        branch_widget,
      },
      lualine_c = {
        "diff",
      },
      lualine_x = {
        "%S",
        recording_widget,
        diagnostics_widget,
      },
      lualine_y = {
        filepath_widget,
      },
      lualine_z = {
        clock_widget,
      },
    },
  },
}
