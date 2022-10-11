return require("packer").startup(function()
    -- Todo comments support
    use "folke/todo-comments.nvim"

    -- Packer plugin manager (manages itself after manual installation)
    use "wbthomason/packer.nvim"

    -- Git symbols in the signcolumn
    use "lewis6991/gitsigns.nvim"

    -- Color schemes
    use "gruvbox-community/gruvbox"

    -- Status line
    use "nvim-lualine/lualine.nvim"

    -- Long live tpope
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"

    -- Show colors
    use { "rrethy/vim-hexokinase", run = "make hexokinase" }

    -- Library of useful functions
    use "nvim-lua/plenary.nvim"

    -- TELESCOPE
    use "nvim-telescope/telescope.nvim"

    -- Common LSP server setups
    use "neovim/nvim-lspconfig"

    -- Completion framework (uses sources for completion, like LSP, buffer...)
    use "hrsh7th/nvim-cmp"

    -- Debugging using DAP
    use "mfussenegger/nvim-dap"
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- Completion sources
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "saadparwaiz1/cmp_luasnip"

    -- Snippet support
    use "L3MON4D3/LuaSnip"

    -- AST based features (like nicer syntax highlighting)
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/playground"
end)
