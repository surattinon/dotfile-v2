---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "dark_horizon",
  transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = require "configs.nvdash"

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers" },
    modules = nil,
    bufwidth = 21,
  },

  statusline = {
    enabled = true,
    theme = "minimal", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
  },

  cmp = {
    lspkind_text = true,
    icon_left = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = { lsp = true, icon = "󱓻" },
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

return M
