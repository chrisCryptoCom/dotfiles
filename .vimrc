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

" Seamless navigation with tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'

"Custom Operators
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'christoomey/vim-sort-motion'

" Custom Text Objects
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'jeetsukumaran/vim-pythonsense'

" Manage Conda Environments
" Plugin 'cjrh/vim-conda'

"Nerdtree Filebrowser
Plugin 'scrooloose/nerdtree'

" Jedi-Vim tags autocomplete etc. for python
Plugin 'davidhalter/jedi-vim'

" Change Filname from within
Plugin 'danro/rename.vim'

" Filetype Plugin for csv files
Plugin 'chrisbra/csv.vim'

" Syntax Checking
Plugin 'vim-syntastic/syntastic'

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
let mapleader = " "

"Shortcut for setting wd to current file
map <Leader>w :lcd %:p:h<CR>

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


" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

"Dislpay all matching files when tab complete
set wildmenu

"Create tags file for tag jumping
command! MakeTags !ctags -R . 

"Show hidden files in NERDTree
let NERDTreeShowHidden=1
nmap <F3> :NERDTreeToggle<CR>

" Martin Brochhaus https://www.youtube.com/watch?v=YhqsjUUHj6g
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" easier moving between tabs
nnoremap tn :tabnew<Space>

nnoremap <Leader><tab> :tabnext<CR>
nnoremap <s-tab> :tabprev<CR>

nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

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

" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = "vnew"
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = 0
map <Leader>b Oimport pdb; pdb.set_trace()<C-c>
map <Leader>B :g/import pdb; pdb.set_trace()/d<CR>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set foldenable              " can slow Vim down with some plugins
set foldlevelstart=99       " can slow Vim down with some plugins
set foldmethod=syntax       " can slow Vim down with some plugins

"Toggle Tagbar
nmap <F8> :TagbarToggle<CR>

"Enable relative numbering
set relativenumber

"Insert mode very slow
set noswapfile

""Enter empty lines in normal mode with enter
"map <Enter> o<ESC>
"map <S-Enter> O<ESC>

"Remap incrementing
nmap <C-c> <C-a>

"Switch off octal numbers"
set nrformats-=octal 
    
"Shortcut to enter uuids
map <Leader>u :py3 import uuid <CR>:%s/$UUID/\=py3eval('str(uuid.uuid4())')/<CR>

"Shortcut to copy filename
noremap <silent> <F4> :let @+=expand("%:p")<CR>
" Redo with U instead of Ctrl+R
noremap U <C-R>
" Open grep results / quickfix in new tab
set switchbuf+=usetab,newtab

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
map <Leader>c :SyntasticToggleMode<CR>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Settings for vim tmux runner
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
nmap <leader>at :VtrAttachToPane<cr>
nmap <leader>or :VtrOpenRunner{'orientation':'v'}<cr>
nmap <leader>cr :VtrClearRunner<cr>
nmap <leader>kr :VtrKillRunner<cr>
nmap <leader>fr :VtrFocusRunner<cr>
" nmap <leader>ar :VtrReattachRunner<cr>
" nmap <leader>sf vae:VtrSendLinesToRunner<cr>
vmap <leader>sf ae:VtrSendLinesToRunner<cr>
nmap <leader>sf vae:VtrSendLinesToRunner<cr>
vmap <leader>sl :VtrSendLinesToRunner<cr>
nmap <leader>sl :VtrSendLinesToRunner<cr>

" Turn syntastic passive by default
