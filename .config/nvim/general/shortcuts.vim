"Shortcut for setting wd to current file
map <Leader>w :lcd %:p:h<CR>

"Quicksave Command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

"Quit Command
noremap <C-Q> :quit<CR>

" Martin Brochhaus https://www.youtube.com/watch?v=YhqsjUUHj6g
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>
"
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





