" Settings specific to file types

" MARKDOWN --------------------------------------------------------------- {{{1

augroup markdown
    autocmd!
    autocmd Filetype markdown setlocal spell spelllang=en_gb
augroup END


" VIM -------------------------------------------------------------------- {{{1

augroup vim_file_group
    autocmd!
    autocmd Filetype vim setlocal foldmethod=marker
augroup END
