require("nvim-ts-autotag").setup {
  auto_close = {
    enabled = true,
  },
  auto_rename = {
    enabled = true,
    closing_node_types = {
      -- jsx
      "jsx_closing_element",

      -- xml,
      "ETag",

      -- html
      "end_tag",
      "erroneous_end_tag",

      -- templ
      "tag_end",
    },
  },
  filetypes = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
    "xml",
    "html",
    "templ",
    "php",
    "vue",
  },
}
