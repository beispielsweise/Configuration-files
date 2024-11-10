-- Plugin bindings
vim.keymap.set('n', '<F2>', ':TagbarToggle<CR>')
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-c>', ':Commentary<CR>', { noremap = true, silent = true })

-- Navigating windows
vim.keymap.set('n', '<C-up>', '<c-w>+', { noremap = true, silent = true })
vim.keymap.set('n', '<C-down>', '<c-w>-', { noremap = true, silent = true })
vim.keymap.set('n', '<C-left>', '<c-w><', { noremap = true, silent = true })
vim.keymap.set('n', '<C-right>', '<c-w>>', { noremap = true, silent = true })

-- Key mappings for splits
vim.keymap.set("n", "<M-.>", "<CMD>vsplit<CR>")
vim.keymap.set("n", "<M-,>", "<CMD>split<CR>")

-- Navigating between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Navigating between tabs
vim.keymap.set("n", "<C-2>", "<C-w>gt")
vim.keymap.set("n", "<C-1>", "<C-w>gT")

-- Always show the signcolumn to prevent text shifts when diagnostics appear
vim.opt.signcolumn = "yes"

-- Autocomplete configuration
local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Tab completion and snippet expansion for coc.nvim
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Tab to confirm or navigate completion items
keyset("i", "<Tab>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<Tab>" : coc#refresh()', opts)
keyset("i", "<S-Tab>", 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', opts)

-- Mapping for confirming selection or expanding snippets
keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], opts)
-- Snippet expansion and jump handling
keyset("i", "<Tab>", [[coc#pum#visible() ? coc#pum#confirm() : coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump', ''])\<CR>" : v:lua.check_back_space() ? "\<Tab>" : coc#refresh()]], opts)
