local packer = require("packer")

packer.startup(function(use)
    -- Plugin manager.
    use({ "wbthomason/packer.nvim" })

    -- Smart AST based features like highlighting, indentation and AST
    -- manipulation.
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Treesitter AST playground.
    use({ "nvim-treesitter/playground" })

    -- Context information using treesitter.
    use({ "nvim-treesitter/nvim-treesitter-context" })

    -- Fuzzy finder.
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
        },
    })

    -- Gruvbox colorstyle.
    use({ "ellisonleao/gruvbox.nvim", lock = true })

    -- Better native search.
    use({ "asiryk/auto-hlsearch.nvim", tag = "1.0.0", lock = true })

    -- Better statusline.
    use({ "nvim-lualine/lualine.nvim" })

    -- Autocomplete framework and sources.
    use({ "hrsh7th/nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp" }) -- LSP source.
    use({ "hrsh7th/cmp-nvim-lua" }) -- NeoVim LUA source.
    use({ "hrsh7th/cmp-buffer" }) -- Buffer source.

    -- Snippet engine.
    use({ "L3MON4D3/LuaSnip", tag = "v1.*" })

    -- Todo comment support.
    use({
        "folke/todo-comments.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Sign column Git diff signs.
    use({ "lewis6991/gitsigns.nvim", lock = true })

    -- Surround.
    use({ "kylechui/nvim-surround", lock = true })

    -- Common LSP server setups.
    use({ "neovim/nvim-lspconfig" })

    -- Rust specific configuration.
    use({
        "simrat39/rust-tools.nvim",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "mfussenegger/nvim-dap" },
        },
    })

    -- Improvements for managing dependencies in the Cargo.toml files.
    use({
        "saecki/crates.nvim",
        tag = "v0.3.0",
        requires = { { "nvim-lua/plenary.nvim" } },
        lock = true,
    })

    -- Debugging using DAP.
    use({ "mfussenegger/nvim-dap" })

    -- UI for nvim-dap.
    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    -- Comment toggling support.
    use({ "terrortylor/nvim-comment", lock = true })
end)
