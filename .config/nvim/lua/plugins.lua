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
	use "neovim/nvim-lspconfig"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"
end)

