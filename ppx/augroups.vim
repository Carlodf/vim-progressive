" Settings specific to file types

" MARKDOWN --------------------------------------------------------------- {{{1

augroup markdown
    autocmd!
    autocmd Filetype markdown setlocal spell spelllang=en_gb
    " wraps text using textwidth
    autocmd Filetype markdown setlocal wrap
    autocmd Filetype markdown setlocal textwidth=80

    autocmd Filetype markdown setlocal autoindent
    " Takes care of list indentation
    autocmd Filetype markdown setlocal formatoptions=tn
augroup END


" VIM -------------------------------------------------------------------- {{{1

augroup vim_file_group
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
    autocmd Filetype vim setlocal foldcolumn=2
augroup END
