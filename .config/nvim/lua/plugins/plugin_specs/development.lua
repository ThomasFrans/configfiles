return {
    -- Autocomplete framework and sources.
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
            },
            {
                "hrsh7th/cmp-nvim-lua",
            },
            {
                "hrsh7th/cmp-buffer",
            },
            {
                "L3MON4D3/LuaSnip",
                version = "^1.0.0",
            },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local plugin_cmp = require("cmp")
            local plugin_luasnip = require("luasnip")

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
        end,
    },

    -- Common LSP server setups.
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local plugin_lspconfig = require("lspconfig")
            local util = require("util")

            -- phpactor PHP LS
            plugin_lspconfig.phpactor.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
                settings = {
                    symfony = {
                        enabled = true,
                    },
                },
            })

            -- GTK blueprint LS
            plugin_lspconfig.blueprint_ls.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            plugin_lspconfig.astro.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            -- ccls C/C++ LS
            plugin_lspconfig.ccls.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
                init_options = {
                    -- Look for compilation data in $root/build where root is the root of
                    -- the project. Root is guessed, as the directory that contains .git,
                    -- compilation_commands.json or compilation.ccls.
                    compilationDatabaseDirectory = "target",
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
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            -- -- Lemminx XML LS
            -- plugin_lspconfig.lemminx.setup({
            --     on_attach = util.setup_lsp_buffer_keymaps,
            --     capabilities = util.lsp_client_capabilities(),
            -- })

            -- VSCode HTML LS
            plugin_lspconfig.html.setup({
                cmd = { "vscode-html-languageserver", "--stdio" },
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
                settings = {
                    html = {
                        format = {
                            indentInnerHtml = true,
                        },
                    },
                },
            })

            -- VSCode CSS LS
            plugin_lspconfig.cssls.setup({
                cmd = { "vscode-css-languageserver", "--stdio" },
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            -- Angular specific LS
            plugin_lspconfig.angularls.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            plugin_lspconfig.tailwindcss.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            -- Typescript LS
            plugin_lspconfig.tsserver.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            -- Bash LS
            plugin_lspconfig.bashls.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            -- Python LS
            plugin_lspconfig.pylsp.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
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
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })

            plugin_lspconfig.typst_lsp.setup({
                on_attach = util.setup_lsp_buffer_keymaps,
                capabilities = util.lsp_client_capabilities(),
            })
        end,
    },
}
