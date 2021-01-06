set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set nocompatible              " be iMproved, required
filetype off                  " required

colorscheme gruvbox
set background=dark
set cursorline

syntax enable

"Rebind Leader Key
let mapleader = " "

"Enable language specific settings
filetype plugin indent on

"Set line numbers on 
set number


"Better Copy and Paste
set pastetoggle=<F2>
set clipboard^=unnamed,unnamedplus

"Enable Mouse
" set mouse=a
set bs=2


"Enable highlight search
set hls is

"Keep Clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))


" Search down into subfolders
" Provides tab-completion for all file-related tasks
" set path+=**

"Dislpay all matching files when tab complete
set wildmenu

"Create tags file for tag jumping
command! MakeTags !ctags -R . 


"Undo history
set history=700
set undolevels=700

"Tab settings
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

"Ignore case when searching
set ignorecase
set smartcase
