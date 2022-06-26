
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"rust", "lua", "bash", "c", "cpp"},
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
