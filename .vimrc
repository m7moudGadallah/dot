" Line numbers
set number
set relativenumber  " Relative line numbers for easy movement

" Enable syntax highlighting and filetype detection
syntax on
filetype plugin indent on

" Scrolling
set scrolloff=10

" Indentation
set tabstop=4       " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4    " Number of spaces to use for autoindent
set expandtab       " Convert tabs to spaces

" Clipboard integration
set clipboard=unnamedplus
" Make `y` in visual mode always copy to system clipboard
vnoremap y "+y
vnoremap Y "+Y

" Status line always visible
set laststatus=2
set statusline=%f\ %y\ %m\ %r\ %= %l,%c\ %p%%

" Normal backspace behavior
set backspace=indent,eol,start
