" Exception handling 
set nocompatible

set textwidth=89
set tabstop=4 shiftwidth=4
set expandtab
set autoindent

" Searching
set hlsearch
set incsearch
set ignorecase
set showmatch

" Mapping
nnoremap <C-S> :w
nnoremap <C-W> :wq

" Encoding
set encoding=utf-8

" Syntax highlighting
syntax on

" Line numbers
set number

" File stats
set ruler

" Highlight current line
set cursorline

" Look and feel
if has("gui_running")
  colorscheme deus
  set columns=90 lines=70
endif
