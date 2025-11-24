require "nvchad.options"
local o = vim.o

-------------
-- CONFIGS --
-------------

-- General
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = "line"
o.cmdheight = 0
o.scrolloff = 10

-- Spelling
o.spelllang = "en_us"
o.spell = true

-- Highlight while yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
