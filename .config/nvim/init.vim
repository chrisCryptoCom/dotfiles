function SourceFile(relativePath)
    let basePath = expand('%:p:h')
    let fullPath = basePath . '/' . a:relativePath
    exec 'source ' . fullPath
endfunction

let configFiles = [
    \'vim-plug/plugins.vim',
    \'general/settings.vim',
    \'general/shortcuts.vim',
    \'general/functions.vim',
    \'plug-config/nerdtree.vim',
    \'plug-config/vim-airline.vim',
    \'plug-config/jedi-vim.vim',
    \'plug-config/vim-tmux-navigator.vim',
    \'plug-config/vim-tmux-runner.vim',
    \'plug-config/coc/coc.vim',
    \'plug-config/fzf.vim',
    \'plug-config/vim-grepper.vim',
    \'plug-config/quick-scope.vim',
    \'plug-config/vim-closetag.vim',
    \]

for f in configFiles
    call SourceFile(f)
endfor

