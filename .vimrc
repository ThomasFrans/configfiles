
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rrethy/vim-hexokinase', {'do': 'make hexokinase'}
Plug 'morhetz/gruvbox'

call plug#end()

color gruvbox
set background=dark

set nocompatible
set number relativenumber
set mouse=a
set splitbelow
set hlsearch
set incsearch
set completeopt=menu,menuone,preview,noselect,noinsert
set cc=80
set hidden
set termguicolors
set autoindent
set title

let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
let g:ale_hover_cursor=1
let g:ale_completion_enabled=1
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

syntax enable
filetype plugin indent on

nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-k> :term ++rows=10<CR>
nnoremap { {zz
nnoremap } }zz

" Utterly shoot myself in my own foot (I'll regret this)
nnoremap <Left> :echo "No left for you bitch!"<CR>
vnoremap <Left> :<C-u>echo "No left for you bitch!"<CR>
inoremap <Left> <C-o>:echo "No left for you bitch!"<CR>
nnoremap <Right> :echo "No right for you bitch!"<CR>
vnoremap <Right> :<C-u>echo "No right for you bitch!"<CR>
inoremap <Right> <C-o>:echo "No right for you bitch!"<CR>
nnoremap <Up> :echo "No up for you bitch!"<CR>
vnoremap <Up> :<C-u>echo "No up for you bitch!"<CR>
inoremap <Up> <C-o>:echo "No up for you bitch!"<CR>
nnoremap <Down> :echo "No down for you bitch!"<CR>
vnoremap <Down> :<C-u>echo "No down for you bitch!"<CR>
inoremap <Down> <C-o>:echo "No down for you bitch!"<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

inoremap <silent><expr> <c-@> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
