local lspconfig = require'lspconfig'

-- Add all of the LSP related keymaps once LSP is attached to a buffer
local function on_attach()
    vim.keymap.set('n', "K", vim.lsp.buf.hover, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "gT", vim.lsp.buf.type_definition, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>dn", vim.diagnostic.goto_next, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>dp", vim.diagnostic.goto_prev, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>dd", "<cmd>Telescope diagnostics<cr>", { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>gF", vim.lsp.buf.formatting, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>gu", vim.lsp.buf.incoming_calls, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>go", vim.lsp.buf.outgoing_calls, { noremap = true, silent = true, buffer = 0 })
end

-- tell the language server what this client is capable of
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Individual language server setup.
-- Lua LS
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

-- Rust LS
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- Bash LS
lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Clangd C/C++/ObjectiveC/ObjectiveC++ LS
-- lspconfig.clangd.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     filetypes = { "c", "cpp", "objc", "objcpp", "arduino" }
-- }

-- ccls C/C++ LS
lspconfig.ccls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
        -- Look for compilation data in $root/build where root is the root of the project.
        -- Root is guessed, as the directory that contains .git, compilation_commands.json or compilation.ccls.
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
    }
}

-- TexLab Latex LS
lspconfig.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Lemminx XML LS
lspconfig.lemminx.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- VSCode HTML LS
lspconfig.html.setup {
    cmd = { "vscode-html-languageserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities
}

-- VSCode CSS LS
lspconfig.cssls.setup {
    cmd = { "vscode-css-languageserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities
}

