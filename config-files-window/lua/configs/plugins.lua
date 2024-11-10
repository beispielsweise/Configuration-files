return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim')
		use('rafi/awesome-vim-colorschemes')
		use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
		use{'neoclide/coc.nvim', branch='release' }
		use('lervag/vimtex')
		use('vim-airline/vim-airline')
		use('vim-airline/vim-airline-themes')
		use('preservim/nerdtree')
		use('tpope/vim-surround')
		use('tpope/vim-commentary')
		use('ap/vim-css-color')
		use('ryanoasis/vim-devicons')
		use('tc50cal/vim-terminal')
		use('terryma/vim-multiple-cursors')
		use('preservim/tagbar')
		use{
			'm4xshen/autoclose.nvim',
			config = function()
				require("autoclose").setup()
			end,
		}
		use('ggandor/leap.nvim')

		use('rust-lang/rust.vim')
	end
})
