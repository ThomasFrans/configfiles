
set nocompatible		" Before anything else, turn off vi compat mode

syntax on			    " Turn syntax highlighting on globally

filetype indent on		" Automatic indentation for known filetypes

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme gruvbox

" Boolean options
set relativenumber number	" Set both relative and normal line numbers on
set hidden			        " Hide buffers when 'closing' them
set mouse=a			        " Enable the mouse
set expandtab			    " Turn tabs into spaces
set tabstop=4			    " The amount of spaces in a tab
set shiftwidth=4		    " Amount of spaces on indent in normal mode
set splitbelow splitright   " We're not insane people here
set laststatus=2            " Statusline also when there is only one window
set colorcolumn=80		    " Draw the right margin
set hlsearch incsearch      " Highlight searches incrementally
set termguicolors           " I still don't know wtf this does
set background=dark         " Default is dark text on light background

" Value options
let NERDTreeMinimalUI=1

" Define variables
let mapleader = " "		    " Use space to activate custom keybindings
let maplocalleader = nr2char(13)	" Use CR as local map leader

" Normal Mode Keybindings
nnoremap <silent> <leader>ev :call OpenVimrcRight()<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

" Insert Mode Keybindings



" Visual Mode Keybindings


" Automatic Commands
" Open NERDTree upon entering Vim
autocmd VimEnter * call OpenNerdTreeLeft()
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Open a terminal upon entering Vim
autocmd VimEnter * call OpenTerminalBelow()
autocmd InsertEnter * :set cursorline
autocmd InsertLeave * :set nocursorline

" Functions
function! OpenVimrcRight()
    vsplit $MYVIMRC
endfunction

function! OpenNerdTreeLeft()
    NERDTree
    wincmd p
endfunction

function! OpenTerminalBelow()
    below terminal ++rows=10
    wincmd p
endfunction
