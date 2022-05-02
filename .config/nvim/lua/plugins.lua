return require("packer").startup(function()
	use "wbthomason/packer.nvim"
	use "gruvbox-community/gruvbox"
	use "itchyny/lightline.vim"
	use "tpope/vim-commentary"
	use "tpope/vim-surround"
	use {"rrethy/vim-hexokinase", run = "make hexokinase"}
	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	use "rust-lang/rust.vim"
	use "tpope/vim-fugitive"
end)

