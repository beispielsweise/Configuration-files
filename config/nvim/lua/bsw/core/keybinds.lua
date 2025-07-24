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
keymap.set("n", "<leader>tm", "<cmd>tabnew %<CR>", { desc = "Open a copy of the current tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close a tab" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Move a to next tab" })
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Move to a previous tab" })
-- keymap.set("n", "<leader>tt", function()
--     vim.cmd("split | terminal")
--     vim.cmd("startinsert")
-- end, { desc = "Open split terminal" })
-- keymap.set("n", "<leader>ty", function()
--     vim.cmd("vsplit | terminal")
--     vim.cmd("startinsert")
-- end, { desc = "Open vsplit terminal" })

-- Rust debugging (DAP/llbl)
-- keymap.set("n", "<leader>bww", function()
--     local ui_open = false
--     for _, win in pairs(vim.api.nvim_list_wins()) do
--         local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win))
--         if bufname:match("DAP") then
--             ui_open = true
--             break
--         end
--     end
--     if ui_open then
--         require("dapui").close()
--     else
--         require("dapui").open()
--     end
-- end, { desc = "Toggle dap-ui" })
--
-- _G.dap_scopes_sidebar = nil -- global scope sidebar instance
-- keymap.set("n", "<leader>bws", function()
--     local widgets = require("dap.ui.widgets")
--     if not _G.dap_scopes_sidebar then
--         _G.dap_scopes_sidebar = widgets.sidebar(widgets.scopes)
--     end
--     local sidebar = _G.dap_scopes_sidebar
--     -- Detect if buffer is visible in any window
--     local buf = sidebar.buf
--     local is_open = false
--     for _, win in ipairs(vim.api.nvim_list_wins()) do
--         if vim.api.nvim_win_get_buf(win) == buf then
--             is_open = true
--             break
--         end
--     end
--
--     if is_open then
--         sidebar:close()
--     else
--         sidebar:open()
--     end
-- end, { desc = "Toggle dap-ui scopes" })

-- keymap.set("n", "<leader>bb", "<cmd>:DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" })
-- keymap.set("n", "<leader>bbc", "<cmd>:DapClearBreakpoints<CR>", { desc = "Clear breakpoints" })
-- keymap.set("n", "<leader>br", function()
--     vim.cmd.RustLsp('debuggables')
--     require("dapui").open()
-- end, { desc = "Start Rust Debugging" })
-- keymap.set("n", "<leader>bq", function()
--     require("dap").terminate()
--     require("dapui").close()
-- end, { desc = "Terminate" })
-- keymap.set("n", "<leader>bc", "<cmd>:DapContinue<CR>", { desc = "Continue" })
-- keymap.set("n", "<leader>ba", "<cmd>:DapStepInto<CR>", { desc = "Step into" })
-- keymap.set("n", "<leader>bs", "<cmd>:DapStepOut<CR>", { desc = "Step out" })
-- keymap.set("n", "<leader>bd", "<cmd>:DapStepOver<CR>", { desc = "Step over" })
