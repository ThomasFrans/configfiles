vim.cmd 'set formatoptions-=o'
vim.opt.laststatus = 3 -- Single status bar for all windows
vim.opt.mouse = "" -- We don't need this anymore >-<
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.fillchars = { eob = ' ' }
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.background = "dark"
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 12
vim.opt.completeopt = {
    "menu",
    "menuone",
    "noselect"
}
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shortmess:append { F = true, I = true }
vim.opt.wildignorecase = true
vim.opt.hlsearch = false
vim.opt.textwidth = 80
vim.opt.clipboard = "unnamedplus"
