let mapleader="\\"
let maplocalleader=","

" Shortcuts to work with configuration files
nnoremap <leader>ev :sp $MYVIMRC <cr>
nnoremap <leader>es :sp $PPXSET <cr>
nnoremap <leader>ef :sp $PPXFUN <cr>
nnoremap <leader>em :sp $PPXMAP <cr>
nnoremap <leader>sv :source $MYVIMRC <cr>

" Use jk to exit inser mode
inoremap jk <esc>

" Mapping to train.
" Commented out since training worked but want my Vim to be more
" usable by other occasional pairs.
" 
" inoremap <esc> <nop>
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

" Easier mappings for moving within splits
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
