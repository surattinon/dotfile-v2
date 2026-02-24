return {
  -- conform
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- blink
  { import = "nvchad.blink.lazyspec" },
  {
    "Saghen/blink.cmp",
    opts = require "configs.blink",
  },

  -- osc52 (clipboard)
  {
    "ojroques/nvim-osc52",
    config = function()
      require "configs.osc52"
    end,
  },

  -- Noice (Better UI)
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require "configs.noice"
    end,
  },

  -- Tmux Navigation
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    cmd = {
      "NvimTmuxNavigateLeft",
      "NvimTmuxNavigateDown",
      "NvimTmuxNavigateUp",
      "NvimTmuxNavigateRight",
    },
    config = function()
      require "configs.tmux-nav"
    end,
  },

  -- oil (File Navigator)
  {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    dependencies = {
      "SirZenith/oil-vcs-status",
    },
    config = function()
      require "configs.oil"
    end,
  },

  -- mini (Mini tools)
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.mini"
    end,
  },

  -- Auto tags
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require "configs.ts-autotag"
    end,
  },

  -- Rainbow Bracket
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.rainbow-del"
    end,
  },

  -- Markdown Viewer
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    config = function()
      require "configs.markview"
    end,
  },

  -- Center plane
  {
    "shortcuts/no-neck-pain.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
      require "configs.no-neck-pain"
    end
  },

  -- Treesitter
  {
  	"nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate',
  	opts = {
      install_dir = vim.fn.stdpath('data') .. '/lazy/nvim-treesitter/parsers',
  		ensure_installed = { "vim", "lua", "vimdoc", "html", "css", "vue", "typescript" },
  	},
  },
}
