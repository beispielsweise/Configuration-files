vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap

-- Plugin bindings
--vim.keymap.set('n', '<F2>', ':TagbarToggle<CR>')
--vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
--vim.keymap.set('n', '<C-c>', ':Commentary<CR>', { noremap = true, silent = true })

-- Navigating windows
keymap.set('n', '<C-up>', '<c-w>-', { desc = "Move the window down" }, { noremap = true, silent = true })
keymap.set('n', '<C-down>', '<c-w>+', { desc = "Move the window up" }, { noremap = true, silent = true })
keymap.set('n', '<C-left>', '<c-w>>', { desc = "Move the window left" }, { noremap = true, silent = true })
keymap.set('n', '<C-right>', '<c-w><', { desc = "Move the window right" }, { noremap = true, silent = true })

-- Key mappings for splits
keymap.set("n", "<M-,>", "<CMD>vsplit<CR>", { desc = "Split the window vertically (left-right)" })
keymap.set("n", "<M-.>", "<CMD>split<CR>", { desc = "Split the window horizontally (top-bottom)" })

-- Navigating between windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to the left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to the right window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to the upper window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to the lower window" })

-- Useful binds
keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open a new empty tab" })
keymap.set("n", "<leader>tt", "<cmd>tabnew %<CR>", { desc = "Open a copy of the current tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close a tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Move a to next tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Move to a previous tab" })
