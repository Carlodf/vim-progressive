" Vundle {{{1
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" calls vundle and set the root installation path for plugins
call vundle#begin('~/.vim/bundles')

"Plugins {{{2
Plugin 'VundleVim/Vundle.vim' "plugin manager
Plugin 'tpope/vim-fugitive' "wrapper for git
Plugin 'Valloric/YouCompleteMe' "code completion
Plugin 'fatih/vim-go' "golang ide
"Plugin 'tpope/vim-vinegar' "files browsing
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'tikhomirov/vim-glsl'
"}}}2

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

set encoding=utf-8

" Configuration files {{{1
let $MYVIMRC = $HOME . '/.vim/vimrc'
let $PPXSET = $HOME . '/.vim/ppx/settings.vim'
let $PPXFUN = $HOME . '/.vim/ppx/functions.vim'
let $PPXMAP = $HOME . '/.vim/ppx/mappings.vim'
let $PPXTMP = $HOME . '/.vim/tmp'

" SETTINGS
source $PPXSET
" FUNTIONS
source $PPXFUN
" MAPPINGS
source $PPXMAP

" }}}


" AUTOCOMANDS {{{1

augroup vimfile
    autocmd!
    :au FileType vim set foldmethod=marker
augroup END

augroup markdown_settings
    autocmd!
    :au FileType markdown setlocal wrap | setlocal textwidth=80 | setlocal spell |
                \setlocal spelllang=en_gb | setlocal formatoptions=tn
    let vim_markdown_preview_hotkey='<leader>m'
augroup END


augroup mail_setlocaltings
    autocmd!
    :au FileType mail setlocal wrap | setlocal textwidth=80 | setlocal spell |
                \setlocal spelllang=en_gb | setlocal formatoptions=tn
augroup END

augroup scons_files
    autocmd!
    au BufNewFile,BufRead SCons* set filetype=scons
augroup END

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    augroup ppx
        au!

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid
        autocmd BufReadPost *
                    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
" }}}


" FUNCTIONS {{{1

" Toggle Windows to max height
function! ToggleFullscreenWindows()
    if &winheight == 1
        let &winheight=9999
        let &winminheight=0
        set noequalalways
    else
        let &winheight=1
        let &winminheight=0
        set equalalways
    endif
endfunction

" Toggle Windows to max height
nnoremap <silent> <leader>tf :call ToggleFullscreenWindows()<CR>


" }}}

" Source VIP wimscripts
:so $HOME/workspace/vimscript/argument_refactor.vim
