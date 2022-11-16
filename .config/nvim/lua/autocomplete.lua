local luasnip = require 'luasnip'
local cmp = require 'cmp'

require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set("i", "<C-h>", function() luasnip.jump(-1) end, { silent = true })
vim.keymap.set("i", "<C-l>", function() luasnip.jump(1) end, { silent = true })

cmp.setup({
    snippet = {
        expand = function(args)
            -- Setup LSP autocomplete with nvim-cmp.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'crates' },
    }, {
        { name = 'buffer', keyword_length = 5 },
    }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})
