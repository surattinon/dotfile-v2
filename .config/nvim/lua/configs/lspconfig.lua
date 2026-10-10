require("nvchad.configs.lspconfig").defaults()

local vue_cfg = require "configs.vue-lspconfig"

local servers = {
  html = {},
  css = {},
  lua_ls = {},
  rust_analyzer = {},
  gopls = {},
  tofu_ls = {},
  markdown_oxide = {},

  -- YAML
  yamlls = {
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = { enable = true }, -- Uses standard yaml formatting
        validate = true,
        schemaStore = {
          -- MUST be disabled to let SchemaStore.nvim handle it
          enable = false,
          url = "",
        },
      },
    },
  },

  -- JS/TS lsp
  ts_ls = {
    init_options = {
      plugins = {
        vue_cfg.vue_plugin,
      },
    },
    filetypes = vue_cfg.ts_filetypes,
  },

  -- VUE.JS
  vue_ls = vue_cfg.vue_ls_config,
  vtsls = {
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            vue_cfg.vue_plugin,
          },
        },
      },
    },
    filetypes = vue_cfg.ts_filetypes,
  },

  -- Harper Spell check
  harper_ls = {
    settings = {
      ["harper-ls"] = {
        linters = {
          SpellCheck = false,
        },
        markdown = {
          IgnoreLinkTitle = true,
        },
        diagnosticSeverity = nil,
      },
    },
    filetypes = { "markdown", "text" },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
