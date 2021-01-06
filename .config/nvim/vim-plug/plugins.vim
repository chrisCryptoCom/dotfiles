" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  let vimrc = expand('%:p:h:h') . '/init.vim'
  autocmd VimEnter * PlugInstall | exec 'source ' . vimrc
endif

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
    " Plug 'unblevable/quick-scope'

    " Vim vue filetype plugin
    Plug 'posva/vim-vue'

    Plug 'alvan/vim-closetag'

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
