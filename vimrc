" Set nocp to never start in Vi compatibility mode which might restrict/modify
" the behavior.
set nocp

" Enable file types, load plugin file and indentation files.
filetype plugin indent on

set encoding=utf-8

" Divide configuration in different files
let $MYVIMRC = $HOME . '/.vim/vimrc'
let $PPXSET = $HOME . '/.vim/ppx/settings.vim'
let $PPXFUN = $HOME . '/.vim/ppx/functions.vim'
let $PPXMAP = $HOME . '/.vim/ppx/mappings.vim'
let $PPXTMP = $HOME . '/.vim/tmp'
" Declare variables to verify files have been sourced
let g:ppx_functions = 0
let g:ppx_settings = 0
let g:ppx_mappings = 0
" FUNTIONS
source $PPXFUN
" SETTINGS
source $PPXSET
" MAPPINGS
source $PPXMAP
