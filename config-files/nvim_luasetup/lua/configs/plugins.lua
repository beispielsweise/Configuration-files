return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim')
		use('https://github.com/rafi/awesome-vim-colorschemes')
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}
		use{ 'https://github.com/neoclide/coc.nvim', branch='release' }
		use('lervag/vimtex')
		use('https://github.com/vim-airline/vim-airline')
		use('https://github.com/vim-airline/vim-airline-themes')
		use('https://github.com/preservim/nerdtree')
		use('http://github.com/tpope/vim-surround')
		use('https://github.com/tpope/vim-commentary')
		use('https://github.com/ap/vim-css-color')
		use('https://github.com/ryanoasis/vim-devicons')
		use('https://github.com/tc50cal/vim-terminal')
		use('https://github.com/terryma/vim-multiple-cursors')
		use('https://github.com/preservim/tagbar')
		use({
			'm4xshen/autoclose.nvim',
			config = function()
				require("autoclose").setup()
			end,
		})
	end
})
