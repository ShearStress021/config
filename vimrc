" --------------
" Basic Settings
" --------------
imap jj <esc>    " Quicky escape to normal mode
set noshowmode
set relativenumber
syntax on
colorscheme pablo
set cursorline " Highlight the line that cursor is on
set tabstop=4  " How many characters wide the tab character should be
set autoindent  " Copy indent level from previous line when starting a new line
set hlsearch 	" Highlight search matches
set ignorecase  " Case insensitive searches...
set smartcase    " ...unless specifically searching for something with uppercase characters
set incsearch    " Start searching while typing
set nocompatible " Required by various plugins to work
filetype plugin indent on    " required
