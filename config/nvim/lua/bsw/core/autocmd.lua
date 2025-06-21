local A = vim.api

A.nvim_create_autocmd('Filetype', {
    pattern = 'asm',
    command = 'setlocal tabstop=2 shiftwidth=2',
})

local mygroup = A.nvim_create_augroup('cursor_off', { clear = true })
A.nvim_create_autocmd({ 'WinLeave' }, {
    pattern = '*',
    command = 'set nocursorline nocursorcolumn',
})
A.nvim_create_autocmd({ 'WinEnter' }, {
    pattern = '*',
    command = 'set cursorline nocursorcolumn',
})
