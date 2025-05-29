-- HACK: VERY IMPORTANT!!!
-- CHECK BELOW!!!

return {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function()
        local on_attach = require("bsw.plugins.lsp.lspconfig").on_attach
        local capabilities = require("bsw.plugins.lsp.lspconfig").capabilities

        local options = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
        return options
    end,
    config = function(_, opts)
        require('rust-tools').setup(opts)

        local rt = require("rust-tools")

        -- HACK: if there is an error related to llbl-vscode:
        -- Download codellbl extension https://github.com/vadimcn/codelldb/releases
        -- Specify files in adabter as listed below:
        rt.setup({
            dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(
                    "/home/beispielsweise/Utils/codelldb/extension/adapter/codelldb",
                    "/home/beispielsweise/Utils/codelldb/extension/lldb/lib/liblldb.so"
                )
            }
        })
    end
}

-- HACK: It can happen, that RustDebuggables will throw errors related to ipair
-- in this case the fix is to replace the following functions in the following files:
-- This is some absolutely diabollical shit, because it simply lacks a check for empty args.
-- No idea, why this does not work in my setup, i'll doubt it'll be fixed in the future so, here it is
-- Future me, PLEASE, DO NOT FORGET THAT THIS SOLUTION ACTUALLY EXITS!!!
--
-- HACK: File ~/.local/share/nvim/lazy/rust-tools.nvim/lua/rust-tools/debuggables.lua
--
--local function build_label(args)
--     local ret = ""
--
--     for _, value in ipairs(args.cargoArgs or {}) do
--         ret = ret .. value .. " "
--     end
--
--     for _, value in ipairs(args.cargoExtraArgs or {}) do
--         ret = ret .. value .. " "
--     end
--
--     if args.executableArgs and not vim.tbl_isempty(args.executableArgs) then
--         ret = ret .. "-- "
--         for _, value in ipairs(args.executableArgs or {}) do
--             ret = ret .. value .. " "
--         end
--     end
--
--     return ret
-- end
--
-- HACK: File ~/.local/share/nvim/lazy/rust-tools.nvim/lua/rust-tools/dap.lua
--
--local function get_cargo_args_from_runnables_args(runnable_args)
--     local cargo_args = runnable_args.cargoArgs or {}
--
--     local message_json = "--message-format=json"
--     if not rt.utils.contains(cargo_args, message_json) then
--         table.insert(cargo_args, message_json)
--     end
--
--     for _, value in ipairs(runnable_args.cargoExtraArgs or {}) do
--         if not rt.utils.contains(cargo_args, value) then
--             table.insert(cargo_args, value)
--         end
--     end
--
--     return cargo_args
-- end
