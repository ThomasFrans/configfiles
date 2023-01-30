-- Enable `ftplugin` loading and file indentation.
vim.cmd("filetype plugin indent on")

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

-- Number of spaces for (auto)indentation.
vim.opt.shiftwidth = 4

-- Number of spaces to substitute <TAB> press with.
vim.opt.softtabstop = 4

-- Number of spaces to render a real <TAB>.
vim.opt.tabstop = 4

-- Text wrapping length (automatically and gq).
vim.opt.textwidth = 80

-- Color column to indicate wrapping length.
vim.opt.colorcolumn = "80"

-- Disable automatic comment when using 'o'.
vim.opt.formatoptions:append({ o = false })

-- Disable default `~` fill character on empty lines.
vim.opt.fillchars = { eob = " " }

-- Always show popup menu (menu, menuone), force user to select one (noselect),
-- show extra info popup if available (preview).
vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }

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
