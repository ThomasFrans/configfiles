-- Add all of the LSP related keymaps once LSP is attached to a buffer
local function on_attach()
    vim.keymap.set('n', "K", vim.lsp.buf.hover, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "gd", vim.lsp.buf.definition, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "gT", vim.lsp.buf.type_definition, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "gi", vim.lsp.buf.implementation, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>dn", vim.diagnostic.goto_next, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>dp", vim.diagnostic.goto_prev, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>dl", "<cmd>Telescope diagnostics<cr>", { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>r", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>a", vim.lsp.buf.code_action, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<leader>gF", vim.lsp.buf.formatting, { noremap = true, silent = true, buffer = 0 })
    vim.keymap.set('n', "<F2>", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = 0 })
end

-- tell the language server what this client is capable of
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP related stuffs
require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
require 'lspconfig'.rust_analyzer.setup({
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
require 'lspconfig'.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Clangd C/C++/ObjectiveC/ObjectiveC++ LS
require 'lspconfig'.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp", "arduino" }
}

-- TexLab Latex LS
require 'lspconfig'.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Lemminx XML LS
require 'lspconfig'.lemminx.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- VSCode HTML LS
require 'lspconfig'.html.setup {
    cmd = { "vscode-html-languageserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities
}

-- VSCode CSS LS
require 'lspconfig'.cssls.setup {
    cmd = { "vscode-css-languageserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities
}
