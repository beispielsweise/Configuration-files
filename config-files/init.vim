"------------------- SETTINGS ---------------------"
set number
" :set relativenumber
:set tabstop=4
:set shiftwidth=4
:set smarttab
" :set noai nocin nosi inde=
:set softtabstop=4
:set mouse=a
:set encoding=UTF-8
:set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
:set completeopt-=previewt
" :set clipboard+=unnamedplus
:colorscheme jellybeans
"------------------- PLUGINS ----------------------"

call plug#begin() " .local/share/nvim/plugged

Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/vim-airline/vim-airline' " Airline status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation

call plug#end()

"------------------- VIMSCRIPT --------------------"

" if the current file type is ASM, set indentation to 2 spaces.
autocmd Filetype asm setlocal tabstop=2 shiftwidth=2
autocmd Filetype c setlocal tabstop=4 shiftwidth=4

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
				autocmd!
				autocmd WinLeave * set nocursorline nocursorcolumn
				autocmd WinEnter * set cursorline nocursorcolumn
augroup END

" ----------------- MAPPING -----------------------"

" You can split the window in Vim by typing :split or :vsplit.
" " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" " Copy to clipboard
noremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Nerd Tree keys
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" TagBar keys
nnoremap <F2> :TagbarToggle<CR>
" Commentary binding
nnoremap <C-c> :Commentary<CR>

" Tab binding
nnoremap <a-'> :tabnew<CR>
nnoremap <a-\> :tabnext<CR>
nnoremap <a-/> :tabclose<CR>

" Terminal
nnoremap <a-,> :TerminalVSplit bash<CR>
nnoremap <a-.> :Terminal bash<CR>

" Splitting
nnoremap <a-[> :vsplit<CR>
nnoremap <a-]> :split<CR>

"--------------------- COC.NVIM STUFF -----------------------"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
