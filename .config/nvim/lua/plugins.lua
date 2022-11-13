return require('packer').startup(function()
    -- Packer plugin manager (manages itself after manual installation)
    use({ 'wbthomason/packer.nvim' })

    -- Todo comments support
    use({ 'folke/todo-comments.nvim', requires = "nvim-lua/plenary.nvim",
        config = function() require("todo-comments").setup() end })

    -- Git symbols in the signcolumn
    use({ 'lewis6991/gitsigns.nvim', config = function() require("gitsigns").setup() end })

    -- Color scheme
    use({ "ellisonleao/gruvbox.nvim", config = function() require("gruvbox").setup() end })

    -- Status line
    use({ 'nvim-lualine/lualine.nvim' })

    -- Long live tpope
    use({ 'tpope/vim-commentary' })
    use({ 'tpope/vim-surround' })
    use({ 'tpope/vim-fugitive' })

    -- Show colors
    use({ 'rrethy/vim-hexokinase', run = 'make hexokinase' })

    -- Library of useful functions
    use({ 'nvim-lua/plenary.nvim' })

    -- TELESCOPE
    use({ 'nvim-telescope/telescope.nvim' })

    -- Common LSP server setups
    use({ 'neovim/nvim-lspconfig' })

    -- Completion framework (uses sources for completion, like LSP, buffer...)
    use({ 'hrsh7th/nvim-cmp' })

    -- Debugging using DAP
    use({ 'mfussenegger/nvim-dap' })
    use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } })

    -- Completion sources
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })
    use({ 'hrsh7th/cmp-nvim-lua' })
    use({ 'saadparwaiz1/cmp_luasnip' })

    -- Snippet support
    use({ 'L3MON4D3/LuaSnip' })

    -- AST based features (like nicer syntax highlighting)
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use({ 'nvim-treesitter/playground' })

    -- Rust
    -- General improvements for working with Rust.
    -- nvim-lspconfig for LSP
    -- plenary and nvim-dap for debugging
    use({ 'simrat39/rust-tools.nvim',
        requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' } })
    -- Improvements for managing dependencies in the Cargo.toml files.
    use({ 'saecki/crates.nvim', tag = 'v0.3.0', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('crates').setup() end })

end)
