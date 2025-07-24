vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local keymap = vim.keymap

-- Highlighting and Notifications binds
keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")

-- Opening UI elements
keymap.set("n", "<leader>,", "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<CR>")
keymap.set("n", "<leader>.", "<cmd>lua require('vscode').action('workbench.action.splitEditorRight')<CR>")
keymap.set("n", "<leader>ee", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
keymap.set("n", "<leader>er", "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
--      Add this to vscode bindings to return to editor
-- {
--   "key": "space e",
--   "command": "workbench.action.focusActiveEditorGroup",
--   "when": "!editorFocus"
-- }
keymap.set("n", "<leader>tt", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap.set("n", "<leader>te", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap.set("n", "<leader>d", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")

-- Searching
keymap.set("n", "<leader>fc", "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")
keymap.set("n", "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")

-- Navigating ui elements
keymap.set("n", "<leader>1", "<cmd>lua require('vscode').action('workbench.action.focusFirstEditorGroup')<CR>")
keymap.set("n", "<leader>2", "<cmd>lua require('vscode').action('workbench.action.focusSecondEditorGroup')<CR>")
keymap.set("n", "<leader>3", "<cmd>lua require('vscode').action('workbench.action.focusThirdEditorGroup')<CR>")
keymap.set("n", "<leader>4", "<cmd>lua require('vscode').action('workbench.action.focusFourthEditorGroup')<CR>")
keymap.set("n", "<leader>tq", "<cmd>lua require('vscode').action('workbench.action.closeEditorsInGroup')<CR>")
keymap.set("n", "<leader>tn", "<cmd>lua require('vscode').action('workbench.action.newWindow')<CR>")
-- <>tq - hide panel
keymap.set({ "n", "v" }, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap.set({ "n", "v" }, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap.set({ "n", "v" }, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap.set({ "n", "v" }, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap.set({ "n", "v" }, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap.set({ "n", "v" }, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- Folding
keymap.set("n", "<leader>zk", "<cmd>lua require('vscode').action('editor.foldAll')<CR>")
keymap.set("n", "<leader>zj", "<cmd>lua require('vscode').action('editor.unfoldAll')<CR>")
keymap.set("n", "<leader>zz", "<cmd>lua require('vscode').action('editor.toggleFold')<CR>")

keymap.set("n", "<leader>i", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")
