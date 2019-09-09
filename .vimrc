set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Git wrapping
Plugin 'tpope/vim-fugitive'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Plugin to remove surrounding brackets braces etc
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Include Pathogen
execute pathogen#infect()

syntax enable
"Rebind Leader Key
let mapleader = ","

"Slimux shortcuts
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>b :SlimuxREPLSendBuffer<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

"Shortcut for setting wd to current file
map <Leader>w :lcd %:p:h<CR>

"Enable language specific settings
filetype plugin indent on

"Set line numbers on 
set number


"Better Copy and Paste
set pastetoggle=<F2>
set clipboard=unnamedplus

"Enable Mouse
set mouse=a
set bs=2


"Quicksave Command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"Enable highlight search
set hls is

"Quit Command
noremap <C-Q> :quit<CR>

"Keep Clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

"Dislpay all matching files when tab complete
set wildmenu

"Create tags file for tag jumping
command! MakeTags !ctags -R . 

"File Browsing
let g:netrw_banner = 0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(q\|\s\s\)\zs\.\S\+'

"Add NerdTree
autocmd vimenter * NERDTree
