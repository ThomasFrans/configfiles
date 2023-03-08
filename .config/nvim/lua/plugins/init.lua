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
local plugin_luasnip = require("luasnip")
local plugin_dap = require("dap")
local plugin_dapui = require("dapui")
local plugin_treesitter_context = require("treesitter-context")

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
        enable = true,
    },
    ensure_installed = {
        "php",
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

plugin_treesitter_context.setup()

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

local capabilities = plugin_cmp_nvim_lsp.default_capabilities()

-- phpactor PHP lS
plugin_lspconfig.phpactor.setup({
    on_attach = lsp_keymaps,
    capabilities = capabilities,
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
plugin_lspconfig.lua_ls.setup({
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
    snippet = {
        expand = function(args)
            plugin_luasnip.lsp_expand(args.body)
        end,
    },
    mapping = plugin_cmp.mapping.preset.insert({
        ["<CR>"] = plugin_cmp.mapping.confirm({ select = true }),
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

plugin_dapui.setup()
plugin_dap.listeners.after.event_initialized["dapui_config"] = function()
    plugin_dapui.open()
end
plugin_dap.listeners.before.event_terminated["dapui_config"] = function()
    plugin_dapui.close()
end
plugin_dap.listeners.before.event_exited["dapui_config"] = function()
    plugin_dapui.close()
end

plugin_dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { "/home/thomas/.local/share/vscode-php-debug/out/phpDebug.js" },
}

plugin_dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
    }
}

plugin_dap.adapters.lldb =
{
    type = "executable",
    command = "/usr/bin/lldb-vscode",
    name = "lldb"
}

plugin_dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        args = {},
    },
    {
        -- If you get an "Operation not permitted" error using this, try disabling YAMA:
        --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        name = "Attach",
        type = "lldb", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
    },
}

plugin_dap.configurations.c = plugin_dap.configurations.cpp
plugin_dap.configurations.rust = plugin_dap.configurations.cpp
plugin_dap.configurations.rust[1]["program"] = function()
    return vim.fn.input(
        "Executable: ",
        vim.fn.getcwd() .. "/target/debug/",
        "file"
    )
end
