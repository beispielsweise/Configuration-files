return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    config = function()
        require('leap').create_default_mappings()
        -- s for forward search
        -- S for backward search
    end,
}
