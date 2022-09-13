vim.cmd("colorscheme gruvbox")

vim.api.nvim_set_var("Hexokinase_optInPatterns", {
    "full_hex",
    "tripple_hex",
    "rgb",
    "rgba",
    "hsl",
    "hsla",
})

vim.api.nvim_set_var("mapleader", " ")
vim.cmd('syntax enable')

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

vim.cmd([[
    let g:lightline = {
        \ 'active': {
        \       'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
        \     }
        \     }
]])
