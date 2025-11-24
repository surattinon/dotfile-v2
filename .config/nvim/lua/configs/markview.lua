local presets = require "markview.presets"
require("markview").setup {
  markdown = {
    headings = presets.headings.glow,
    horizontal_rules = presets.horizontal_rules.thick,
    tables = presets.tables.rounded,
  },
  experimental = { check_rtp = false },
}
