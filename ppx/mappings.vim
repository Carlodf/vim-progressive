let mapleader="\\"
let maplocalleader=","

" make sure functions are sourced
if g:ppx_functions == 0
    source $PPXFUN
endif

" Config files editing---------------------------------------------------- {{{1

" Shortcuts to work with configuration files
nnoremap <leader>ev :sp $MYVIMRC <cr>
nnoremap <leader>es :sp $PPXSET <cr>
nnoremap <leader>ef :sp $PPXFUN <cr>
nnoremap <leader>em :sp $PPXMAP <cr>
nnoremap <leader>ea :sp $PPXAUG <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>

" Inser mode-------------------------------------------------------------- {{{1
"
" Use jk to exit inser mode
inoremap jk <esc>

" Noemal mode------------------------------------------------------------- {{{1

" Easier mappings for moving within splits
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>

" Toggle view port size fullscreen/equalsize
nnoremap <silent> <leader>tf :call ToggleFullscreenWindows()<CR>
"

" DISABLED---------------------------------------------------------------- {{{1
" Mapping to train.
" Commented out since training worked but want my Vim to be more
" usable by other occasional pairs.
" 
" inoremap <esc> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

" EOF--------------------------------------------------------------------- {{{1
" LEAVE AT END OF FILE
" Global variable to signal the mappings have been sourced.
let g:ppx_functions = 1
