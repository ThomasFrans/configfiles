require'plugins'

vim.api.nvim_command("colorscheme gruvbox")

vim.opt.laststatus = 3
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true 
vim.opt.fillchars = {eob = ' '} 
vim.opt.termguicolors = true
vim.opt.showmode = true
vim.opt.background = "dark"
vim.opt.shortmess = "I"
vim.opt.title = true
vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.colorcolumn = "80"

vim.api.nvim_set_var("Hexokinase_optInPatterns", {
	"full_hex",
	"tripple_hex",
	"rgb",
	"rgba",
	"hsl",
	"hsla",
})
vim.api.nvim_set_var("mapleader", " ")

vim.api.nvim_set_keymap('n', "<space>", "<nop>", {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', "<space>ff", "<cmd>Telescope find_files<cr>", {
	noremap=true,
	silent=true
})

vim.cmd([[
	hi WinSeparator guibg=None 
	hi ColorColumn guibg=gray20
]])

