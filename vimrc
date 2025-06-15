
inoremap jj <esc> " Quick Escape to normal mode
set nocompatible
filetype off

set relativenumber " line numbers
set noshowmode
set tabstop=4
set hlsearch
set smartcase
set fileformat=unix
set fileencoding=utf-8
set t_Co=256
set t_ut=
set clipboard=unamedplus
syntax enable
set laststatus=2
set shiftwidth=4
set autoindent
set noexpandtab

filetype plugin indent on
let mapleader = "\<space>"
nnoremap <leader>t :below terminal<CR>

" better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l



call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim' " Plugin for colorscheme 
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
call plug#end()
"  plugins Setup
colorscheme onedark

" nerdtree plugin settings
nnoremap <leader> n: NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

