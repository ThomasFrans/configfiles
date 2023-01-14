require("plugins/options")
require("plugins/keymaps")

local plugin_treesitter = require("nvim-treesitter.configs")
local plugin_auto_hlsearch = require("auto-hlsearch")
local plugin_lualine = require("lualine")
local plugin_lspconfig = require("lspconfig")
local plugin_rust_tools = require("rust-tools")
local plugin_cmp_nvim_lsp = require("cmp_nvim_lsp")
local plugin_cmp = require("cmp")
local plugin_nvim_comment = require("nvim_comment")
local plugin_nvim_surround = require("nvim-surround")
local plugin_todo_comments = require("todo-comments")
local plugin_gitsigns = require("gitsigns")
local plugin_crates = require("crates")

local capabilities = plugin_cmp_nvim_lsp.default_capabilities()

-- stylua: ignore
local function lsp_keymaps(_, bufnr)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr })
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = bufnr })
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = bufnr })
    vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<cr>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = bufnr })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = bufnr })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { buffer = bufnr })
    vim.keymap.set("n", "<leader>si", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "[S]how [i]ncoming calls." })
    vim.keymap.set("n", "<leader>so", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "[S]how [o]utgoing calls." })
end

plugin_nvim_comment.setup()

plugin_todo_comments.setup()

plugin_nvim_surround.setup()

plugin_gitsigns.setup()

plugin_crates.setup()

plugin_treesitter.setup({
    playground = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enabled = true,
    },
    ensure_installed = {
        "rust",
        "lua",
        "c",
        "cpp",
        "html",
        "css",
        "javascript",
        "toml",
        "bash",
    },
    sync_install = false,
})

plugin_auto_hlsearch.setup()

plugin_lualine.setup({
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    tabline = {
        lualine_a = { "branch" },
        lualine_b = { "diff" },
        lualine_z = { "tabs" },
    },
})

-- ccls C/C++ LS
plugin_lspconfig.ccls.setup({
    on_attach = lsp_keymaps,
    capabilities = capabilities,
    init_options = {
        -- Look for compilation data in $root/build where root is the root of
        -- the project. Root is guessed, as the directory that contains .git,
        -- compilation_commands.json or compilation.ccls.
        compilationDatabaseDirectory = "target/debug",
        index = {
            threads = 0,
        },
        clang = {
            excludeArgs = { "-frounding-math" },
        },
    },
})

-- TexLab Latex LS
plugin_lspconfig.texlab.setup({
    on_attach = lsp_keymaps,
    capabilities = capabilities,
})

-- Lemminx XML LS
plugin_lspconfig.lemminx.setup({
    on_attach = lsp_keymaps,
    capabilities = capabilities,
})

-- VSCode HTML LS
plugin_lspconfig.html.setup({
    cmd = { "vscode-html-languageserver", "--stdio" },
    on_attach = lsp_keymaps,
    capabilities = capabilities,
})

-- VSCode CSS LS
plugin_lspconfig.cssls.setup({
    cmd = { "vscode-css-languageserver", "--stdio" },
    on_attach = lsp_keymaps,
    capabilities = capabilities,
})

-- Bash LS
plugin_lspconfig.bashls.setup({
    on_attach = lsp_keymaps,
    capabilities = capabilities,
})

-- Python LS
plugin_lspconfig.pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "W391" },
                    maxLineLength = 80,
                },
            },
        },
    },
})

-- Lua LS
plugin_lspconfig.sumneko_lua.setup({
    on_attach = lsp_keymaps,
    capabilities = capabilities,
})

-- Rust LS
plugin_rust_tools.setup({
    server = {
        on_attach = lsp_keymaps,
    },
})

plugin_cmp.setup({
    mapping = plugin_cmp.mapping.preset.insert({
        ["<CR"] = plugin_cmp.mapping.confirm({ select = false }),
        ["<C-b>"] = plugin_cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = plugin_cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = plugin_cmp.mapping.complete(),
        ["<C-e>"] = plugin_cmp.mapping.abort(),
    }),
    sources = plugin_cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "crates" },
    }),
    {
        { name = "buffer" },
    },
})
