require 'plugins'

vim.api.nvim_command("colorscheme gruvbox")

vim.opt.laststatus = 3
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.background = "dark"
vim.opt.shortmess = "I"
vim.opt.title = true
vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 12
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.textwidth = 80
vim.opt.shortmess = "F"

vim.api.nvim_set_var("Hexokinase_optInPatterns", {
    "full_hex",
    "tripple_hex",
    "rgb",
    "rgba",
    "hsl",
    "hsla",
})

vim.api.nvim_set_var("mapleader", " ")

vim.api.nvim_set_keymap('n', "<space>", "<nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', "<space>ff", "<cmd>Telescope find_files<cr>", {
    noremap = true,
    silent = true
})
vim.keymap.set('n', "<space>fw", "<cmd>Telescope live_grep<cr>", {
    noremap = true,
    silent = true
})

vim.cmd([[
	hi WinSeparator guibg=None 
	hi ColorColumn guibg=gray30
    hi Normal guibg=None
]])


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

-- Setup LSP autocomplete with nvim-cmp.
local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- Border around the windows drawn by cmp-nvim
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- ['<S-Space>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

require'nvim-treesitter.configs'.setup {
    ensure_installed = {"rust", "lua", "bash", "c", "cpp"},
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
