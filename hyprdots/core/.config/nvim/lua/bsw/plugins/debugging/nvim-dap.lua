return {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
        require("dap").configurations.rust = {
            {
                name = "Rust: Debug with stdin",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                runInTerminal = true,
            },
        }
    end,
}
