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

" Normal backspace behavior
set backspace=indent,eol,start

" Function to return highlight + mode name
function! StatusLine()
    let l:mode_map = {
    \ 'n': ['StatusModeNormal', 'NORMAL'],
    \ 'i': ['StatusModeInsert', 'INSERT'],
    \ 'v': ['StatusModeVisual', 'VISUAL'],
    \ 'V': ['StatusModeVisual', 'V-LINE'],
    \ "\<C-v>": ['StatusModeVisual', 'V-BLOCK'],
    \ 'R': ['StatusModeReplace', 'REPLACE'],
    \ 'c': ['StatusModeCommand', 'COMMAND']
    \ }
    let l:current = get(l:mode_map, mode(), ['StatusModeNormal', mode()])
    " Build full statusline: mode block + rest of info
    return '%#'.l:current[0].'# '.l:current[1].' %#StatusLine# %f %y %m %r %= %l,%c %p%%'
endfunction

" Highlight groups
highlight StatusModeNormal  guifg=#000000 guibg=#00ff00 ctermfg=black ctermbg=green
highlight StatusModeInsert  guifg=#000000 guibg=#ffff00 ctermfg=black ctermbg=yellow
highlight StatusModeVisual  guifg=#ffffff guibg=#ff00ff ctermfg=white ctermbg=magenta
highlight StatusModeReplace guifg=#ffffff guibg=#ff0000 ctermfg=white ctermbg=red
highlight StatusModeCommand guifg=#000000 guibg=#00ffff ctermfg=black ctermbg=cyan

" Always show statusline and evaluate our function
set laststatus=2
set statusline=%!StatusLine()

