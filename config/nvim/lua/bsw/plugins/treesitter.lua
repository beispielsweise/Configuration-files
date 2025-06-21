return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "svelte",
                "graphql",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "rust",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = false,   -- "<C-space>",
                    node_incremental = false, -- "<C-space>",
                    scope_incremental = false,
                    node_decremental = false, --"<bs>",
                },
            },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },
        })

        -- Enable Treesitter folding
        vim.wo.foldmethod = 'expr'
        vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

        -- Keybindings for Treesitter folding
        local keymap = vim.keymap

        keymap.set('n', '<leader>zk', 'zM', { desc = "Fold all" })
        keymap.set('n', '<leader>zj', 'zR', { desc = "Unfold all" })
        keymap.set('n', '<leader>zz', 'za', { desc = "Toggle fold under cursor" })
    end,
}
