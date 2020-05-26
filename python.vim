"Python configurations for vim

"Set tab to 4 spaces
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

"Set line length marker to 80
:setlocal colorcolumn=80

"Shortcut to run file in python
nnoremap <Leader>r :exec '!python' shellescape(@%, 1)<cr>

