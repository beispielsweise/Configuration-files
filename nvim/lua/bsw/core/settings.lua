vim.cmd("let g:netrw_liststyle=3")

local o = vim.o

vim.scriptencoding = "utf-8"

-- Editor options
o.encoding = "UTF-8"
o.number = true
o.relativenumber = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smarttab = true

o.wrap = true

o.ignorecase = true
o.smartcase = true

o.backspace = "indent,eol,start"
o.splitright = true
o.splitbelow = true

-- Enough for windows, for linux install xclip
o.clipboard = "unnamedplus"

-- For rust.vim plugin
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- o.autoindent = b
-- o.expandtab = b
o.cursorline = true

-- :set noai nocin nosi inde=
o.softtabstop = 4
o.mouse = a
o.wildignore = "8.docx, *.jpg, *.png, *.gif, *.pdf"

o.termguicolors = true
vim.cmd("colorscheme gruvbox-modified-by-retr0")

function Transparent(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Transparent()
