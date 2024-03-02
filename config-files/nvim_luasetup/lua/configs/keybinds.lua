vim.keymap.set('n', '<F2>', ':TagbarToggle<CR>')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent})
vim.keymap.set('n', '<C-c>', ':Commentary<CR>', { noremap = true, silent})
vim.keymap.set('n', '<C-up>', '<c-w>+', { noremap = true, silent})
vim.keymap.set('n', '<C-down>', '<c-w>-', { noremap = true, silent})
vim.keymap.set('n', '<C-left>', '<c-w>>', { noremap = true, silent})
vim.keymap.set('n', '<C-right>', '<c-w><', { noremap = true, silent})

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
