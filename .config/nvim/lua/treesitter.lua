
require'nvim-treesitter.configs'.setup {
    playground =  {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        }
    },
    ensure_installed = {"rust", "lua", "bash", "c", "cpp"},
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- textobjects = {
    --     select = {
    --         enable = true,

    --         -- Automatically jump forward to textobj, similar to targets.vim
    --         lookahead = true,

    --         keymaps = {
    --             -- You can use the capture groups defined in textobjects.scm
    --             ["af"] = "@function.outer",
    --             ["if"] = "@function.inner",
    --             ["ac"] = "@conditional.outer",
    --             ["ic"] = "@conditional.inner",
    --             ["c"] = "@comment.outer",
    --         },
    --         -- You can choose the select mode (default is charwise 'v')
    --         selection_modes = {
    --             ['@parameter.outer'] = 'v', -- charwise
    --             ['@function.outer'] = 'V', -- linewise
    --             ['@class.outer'] = '<c-v>', -- blockwise
    --         },
    --         -- If you set this to `true` (default is `false`) then any textobject is
    --         -- extended to include preceding xor succeeding whitespace. Succeeding
    --         -- whitespace has priority in order to act similarly to eg the built-in
    --         -- `ap`.
    --         include_surrounding_whitespace = true,
    --     },
    -- },
}
