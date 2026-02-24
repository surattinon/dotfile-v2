require("nvchad.configs.lspconfig").defaults()

local vue_cfg = require("configs.vue-lspconfig")

local servers = {
  html = {},
  css = {},
  lua_ls = {},
  rust_analyzer = {},

  ts_ls = {
    init_options = {
      plugins = {
        vue_cfg.vue_plugin,
      },
    },
    filetypes = vue_cfg.ts_filetypes,
  },

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
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
