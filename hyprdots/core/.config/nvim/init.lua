if vim.g.vscode then
    require("bsw.core-vscode")
    require("bsw.lazy-vscode")
else
    require("bsw.core")
    require("bsw.lazy")
end
