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


"Add prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile
