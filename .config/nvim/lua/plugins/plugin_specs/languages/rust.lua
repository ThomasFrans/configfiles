local util = require("util")

return {
    -- Improvements for managing dependencies in the Cargo.toml files.
    {
        "saecki/crates.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } },
        event = { "BufReadPre Cargo.toml" },
        commit = "1dffccc",
        opts = {},
    },

    -- Rust specific configuration.
    {
        "simrat39/rust-tools.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "mfussenegger/nvim-dap" },
        },
        opts = {
            server = {
                on_attach = util.setup_lsp_buffer_keymaps,
            },
        },
    },
}
