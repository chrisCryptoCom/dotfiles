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

"Shortcut to enter uuids
map <Leader>u :py3 import uuid <CR>:%s/$UUID/\=py3eval('str(uuid.uuid4())')/<CR>
"Shortcut to copy filename
noremap <silent> <F4> :let @+=expand("%:p")<CR>
" Redo with U instead of Ctrl+R
noremap U <C-R>

inoremap § <Esc>

" Copy filepath to clipboard
nmap <leader>p :let @*=expand("%:p")<CR>

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
