return {
    -- Smart AST based features like highlighting, indentation and AST
    -- manipulation.
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            playground = {
                enable = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            ensure_installed = {
                "arduino",
                "bash",
                "bibtex",
                "blueprint",
                "c",
                "c_sharp",
                "cpp",
                "css",
                "diff",
                "html",
                "javascript",
                "json",
                "kdl",
                "lua",
                "markdown",
                "php",
                "phpdoc",
                "ron",
                "rust",
                "sql",
                "toml",
                "typescript",
                "v",
                "vala",
                "verilog",
                "yaml",
                "zig",
            },
            sync_install = false,
        },
    },

    -- Context information using treesitter.
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufAdd",
        opts = {},
    },

    -- Automatic XML-like tag magic using treesitter.
    {
        "windwp/nvim-ts-autotag",
        commit = "26761ba",
        event = { "BufReadPre", "BufNewFile" },
    },
}
