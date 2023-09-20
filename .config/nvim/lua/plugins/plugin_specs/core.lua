return {
    {
        "folke/lazy.nvim",
        version = "^9.14.6",
    },

    {
        "numToStr/Comment.nvim",
        version = "^0.8.0",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    -- Better native search.
    {
        "asiryk/auto-hlsearch.nvim",
        version = "^1.1.0",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    -- Surround.
    {
        "kylechui/nvim-surround",
        version = "^2.0.5",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    -- Filesystem browser.
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "^2.58.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
        end,
        keys = {
            {
                "<leader>e",
                ":Neotree<CR>",
                desc = "Open Neotree",
                silent = true,
            },
        },
        opts = {
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    hide_gitignored = false,
                    hide_dotfiles = false,
                },
                follow_current_file = true,
            },
        },
    },

    -- Fuzzy finder.
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        keys = {
            {
                "<leader>ff",
                ":Telescope find_files hidden=true<CR>",
                desc = "Find files",
                silent = true,
            },
            {
                "<leader>fw",
                ":Telescope live_grep<CR>",
                desc = "Find words",
                silent = true,
            },
            {
                "<leader><space>",
                ":Telescope buffers<CR>",
                desc = "Find buffers",
                silent = true,
            },
        },
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "^.git$",
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
            },
        },
    },
}
