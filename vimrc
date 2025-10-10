inoremap jj <esc> " Quick Escape to normal mode set nocompatible
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
" set clipboard=unamedplus
syntax enable
set laststatus=2
set shiftwidth=4
set autoindent
set noexpandtab
set nu

filetype plugin indent on
let mapleader = "\<space>"
nnoremap <leader>t :below terminal<CR>
set shellslash

" better window navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
"
"
"
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin("~/vimfiles/bundle")
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim' " Plugin for colorscheme 
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
" "  plugins Setup
" colorscheme onedark
"
" " nerdtree plugin settings
" nnoremap <leader> n: NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
