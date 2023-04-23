return {
    -- Better statusline.
    {
        "nvim-lualine/lualine.nvim",
        events = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "diagnostics" },
                lualine_c = { "diff", { "filename", path = 1 } },
                lualine_x = { "branch", "encoding", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        },
    },

    -- Gruvbox colorstyle.
    {
        "ellisonleao/gruvbox.nvim",
        commit = "df149bc",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("silent! colorscheme gruvbox")
        end,
    },

    -- Sign column Git diff signs.
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },

    -- Todo comment support.
    {
        "folke/todo-comments.nvim",
        version = "^1.1.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        events = { "BufReadPost", "BufNewFile" },
        keys = {
            { "<leader>fm", ":TodoTelescope<CR>", desc = "Find marks" },
        },
        opts = {},
    },
}
