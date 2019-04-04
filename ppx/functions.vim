
" functions#colorscheme--------------------------------------------------- {{{1
"
" Checks if colorscheme file exists.
function! functions#colorscheme(name)
    let color_path = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, color_path))
endfunction


" functions#toggleFullScreenViewport-------------------------------------- {{{1
"
" " Toggle Windows to max height
function! ToggleFullscreenWindows()
    if &winheight < 9999 || &winwidth < 9999
        let &winheight=9999
        let &winminheight=0
        let &winwidth=9999
        let &winminwidth=0
        set noequalalways
    else
        let &winheight=1
        let &winminheight=0
        let &winwidth=1
        let &winminwidth=0
        set equalalways
    endif
endfunction

" functions#diffWithSaved ------------------------------------------------ {{{1

function! functions#diffWithSaved()
" Save file type
  let filetype=&ft
" Create a new split from original file
  vert new | r ++edit # | 0d_
" Set the buffer in nofile mode
  exe "setlocal bt=nofile"
" Copy the file type to the new split
  exe "setlocal ft=" .filetype
" Diff split with the original file
  diffthis
" Diff the split with the changed file and move the cursor to right split
  wincmd p | diffthis | wincmd l
endfunction

" EOF--------------------------------------------------------------------- {{{1
" LEAVE AT END OF FILE
" Global variable to signal the functions have been sourced.
let g:ppx_functions = 1
