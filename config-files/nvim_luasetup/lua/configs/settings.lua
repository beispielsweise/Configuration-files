local g = vim.g
local o = vim.o

o.number = true
o.tabstop = 4
o.shiftwidth = 4
o.smarttab = true
-- :set noai nocin nosi inde=
o.softtabstop = 4
o.mouse = a
o.wildignore = "8.docx, *.jpg, *.png, *.gif, *.pdf"
o.encoding = "UTF-8"

o.termguicolors = true
vim.cmd("colorscheme gruvbox-modified-by-retr0")
