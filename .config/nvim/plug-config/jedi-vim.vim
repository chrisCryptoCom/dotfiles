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



