" Helps force plugins to load correctly when it is turned back on below
filetype off
set nocompatible

" Syntax highlighting
syntax on

" Line numbers
set number

" File stats
set ruler

" Highlight current line
set cursorline

" Auto indentation
set autoindent

" Show matching code scopes
set showmatch

" Encoding
set encoding=utf-8

" Wrapping

"set textwidth=89

"  Tabspace
set tabstop=4 shiftwidth=4
set expandtab


" Searching
set hlsearch
set incsearch
set ignorecase
set showmatch

" Look and feel
if has("gui_running")
  colorscheme deus
  set columns=90 lines=70
endif

