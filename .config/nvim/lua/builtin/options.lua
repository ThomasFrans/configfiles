-- Enable truecolor support.
vim.opt.termguicolors = true

-- Single global statusline.
vim.opt.laststatus = 3

-- Disable welcome message (I) and bottom file info (F).
vim.opt.shortmess:append({ F = true, I = true })

-- Don't show the mode, done by statusline.
vim.opt.showmode = false

-- Allow to set window title.
vim.opt.title = true

-- New windows open on the right instead of left.
vim.opt.splitright = true

-- New windows open on the bottom instead of top.
vim.opt.splitbelow = true

-- Line numbers on.
vim.opt.number = true

-- Relative line numbers.
vim.opt.relativenumber = true

-- Disable mouse support in all modes.
vim.opt.mouse = ""

-- Use spaces instead of <TAB> to indent.
vim.opt.expandtab = true

-- Color column at text width.
vim.opt.colorcolumn = "+1"

-- Disable default `~` fill character on empty lines.
vim.opt.fillchars:append({ eob = " " })

-- Always show popup menu (menu, menuone), force user to select one (noselect),
-- show extra info popup if available (preview).
vim.opt.completeopt:append({ "menuone", "noselect" })

-- Ignore case when completing file/directory names.
vim.opt.wildignorecase = true

-- Disable line wrapping.
vim.opt.wrap = false

-- Set distance cursor should maintain from edges.
vim.opt.scrolloff = 12

-- Set system clipboard as default register.
vim.opt.clipboard = "unnamedplus"

-- Persist undo information between NeoVim sessions.
vim.opt.undofile = true

-- Automatic indentation when adding a newline, based on context and language.
vim.opt.smartindent = true

-- Set <leader> to spacebar.
vim.g.mapleader = " "

-- Disable the top text in Netrw.
vim.g.netrw_banner = 0

-- Enable line numbers in netrw.
vim.g.netrw_bufsettings = "nu rnu"
