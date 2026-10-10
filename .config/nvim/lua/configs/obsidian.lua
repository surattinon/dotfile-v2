local M = {}

M.legacy_commands = false

M.workspaces = {
  {
    name = "zaintinel",
    path = "~/Nextcloud/mySMB/workspace/Obsidian-sync/zaintinel",
  },
}

M.notes_subdir = "Fleeting Notes"
M.note = {
  template = (function()
    local root = vim.iter(vim.api.nvim_list_runtime_paths()):find(function(path)
      return vim.endswith(path, "obsidian.nvim")
    end)
    if not root then
      return nil
    end
    return vim.fs.joinpath(root, "data/default_template.md")
  end)(),
}

M.daily_notes = {
  enabled = true,
  folder = "02 - Daily Notes",
  date_format = "YYYY-MM-DD",
  alias_format = nil,
  default_tags = { "daily-notes" },
  workdays_only = true,
}

return M
