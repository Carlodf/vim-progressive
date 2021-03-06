" Boilerplate ------------------------------------------------------------ {{{1
" Set nocp to never start in Vi compatibility mode which might restrict/modify
" the behavior.
set nocp

" Enable file types, load plugin file and indentation files.
filetype plugin indent on

set encoding=utf-8


" Config files ----------------------------------------------------------- {{{1

" Divide configuration in different files
let $MYVIMRC = $HOME . '/.vim/vimrc'
let $PPXSET = $HOME . '/.vim/ppx/settings.vim'
let $PPXFUN = $HOME . '/.vim/ppx/functions.vim'
let $PPXMAP = $HOME . '/.vim/ppx/mappings.vim'
let $PPXAUG = $HOME . '/.vim/ppx/augroups.vim'
let $PPX = $HOME . '/.vim/ppx'
let $PPXTMP = $HOME . '/.vim/ppx/tmp'

" Temporary way of sourcing this file (should probably just go in autoload)
let $PPXPY = $PPX . '/python_indent.vim'
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
" AUGROUPS
if has("autocmd")
    source $PPXAUG
    source $PPXPY
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig call functions#diffWithSaved()
endif

