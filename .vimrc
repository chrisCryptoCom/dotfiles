set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plug 'morhetz/gruvbox'
" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

"Git wrapping
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

" Some helpful shortcuts 
Plug 'tpope/vim-unimpaired'

" Seamless navigation with tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'

"Custom Operators
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-sort-motion'

" Custom Text Objects
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'pixelneo/vim-python-docstring'

" Scala Plugs
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"Nerdtree Filebrowser
Plug 'scrooloose/nerdtree'

" Jedi-Vim tags autocomplete etc. for python
Plug 'davidhalter/jedi-vim'

" Change Filname from within
Plug 'danro/rename.vim'

" Filetype Plug for csv files
Plug 'chrisbra/csv.vim'

" Syntax Checking
Plug 'vim-syntastic/syntastic'

" Latex editing
Plug 'lervag/vimtex'

" Get them snippets
Plug 'honza/vim-snippets'

" Fuzzy Finding https://www.chrisatmachine.com/Neovim/08-fzf/
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Case sensitive substitution and other goodies
Plug 'tpope/vim-abolish'

" Automaticall unhighlight search results after moving browser
Plug 'haya14busa/is.vim'

" Visually search for expression selected
Plug 'bronson/vim-visual-star-search'
 
" Search and replace project wide
Plug 'mhinz/vim-grepper'

" Highlight unique character for each word to support f, t navigation
Plug 'unblevable/quick-scope'

" Vim vue filetype plugin
Plug 'posva/vim-vue'

Plug 'alvan/vim-closetag'



" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


colorscheme gruvbox
set background=dark
set cursorline

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
" set path+=**

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


" easier moving between tabs
nnoremap tf :tabfind<Space>
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



" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set foldenable              " can slow Vim down with some plugins
set foldlevelstart=99       " can slow Vim down with some plugins
set foldmethod=syntax       " can slow Vim down with some plugins

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


" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Settings for tmux navigatornnoremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
nmap <silent> <C-j> :TmuxNavigateDown<cr>
nmap <silent> <C-k> :TmuxNavigateUp<cr>
nmap <silent> <C-l> :TmuxNavigateRight<cr>
nmap <silent> <C-h> :TmuxNavigateLeft<cr>

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
" When you forget sudo
cmap w!! w !sudo tee > /dev/null %
vmap <leader>sl :VtrSendLinesToRunner<cr>
nmap <leader>sl :VtrSendLinesToRunner<cr>

" Turn syntastic passive by default
inoremap § <Esc>

" Copy filepath to clipboard
nmap <leader>p :let @*=expand("%:p")<CR>


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

" Use <C-e> for trigger snippet expand.
imap <C-e> <Plug>(coc-snippets-expand)
" GO back through autocompletions with S-Tab
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Confirm with enter
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <buffer> <silent><expr> <S-space> coc#refresh()
let g:coc_snippet_next = '<tab>'


" GoTo code navigation.
nmap <buffer> <leader>gd <Plug>(coc-definition)
nmap <buffer> <leader>gy <Plug>(coc-type-definition)
nmap <buffer> <leader>gi <Plug>(coc-implementation)
nmap <buffer> <leader>gr <Plug>(coc-references)
nnoremap <buffer> <leader>cr :CocRestart

set statusline^=%{coc#status()}

nmap <leader>cl :CocCommand python.setLinter<CR>

" Enable find command 
set path+=**

"FZF Configuration
"" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
" map <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>


let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gb :GitBlame<CR>

" Autocreate parent directories on save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Source https://github.com/nickjj/dotfiles/blob/master/.vimrc
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>s :%s///g<Left><Left>
nnoremap <Leader>sc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>s :s///g<Left><Left>
xnoremap <Leader>sc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" .............................................................................
" unblevable/quick-scope
" .............................................................................

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

" Coc configuration
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-tsserver', 
  \ 'coc-python', 
  \ 'coc-prettier', 
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-json', 
  \ 'coc-vetur',
  \ ]


" Closetag config
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"Add prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"Set pyx version
set pyxversion=3
let g:python3_host_prog = '/usr/local/bin/python3'

