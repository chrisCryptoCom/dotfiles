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

