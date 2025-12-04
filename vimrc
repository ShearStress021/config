inoremap jj <esc> " Quick Escape to normal mode
set nocompatible
filetype off

set relativenumber " line numbers
set nu
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

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'joshdick/onedark.vim' " Plugin for colorscheme 
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

" theme color setups
let g:onedark_termcolors=256
colorscheme onedark

" nerdtree plugin settings
nnoremap <leader> n: NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" You Complete Me settiing
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" highlighting line
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
" background black
highlight Normal guibg=grey80 ctermbg=None
