syntax on
set number
set ruler
set cursorline
set encoding=utf-8

set autoindent
set textwidth=89 columns=90
set tabstop=4 shiftwidth=4
set expandtab

set hlsearch
set incsearch
set ignorecase
set showmatch

if has("gui_running")
  colorscheme deus
  set lines=70
  set go-=T go-=m go-=r
else
  colorscheme hybrid
  set lines=35
endif


