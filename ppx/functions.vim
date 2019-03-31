
" functions#colorscheme--------------------------------------------------- {{{1
"
" Checks if colorscheme file exists.
function! functions#colorscheme(name)
    let color_path = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, color_path))
endfunction

" EOF--------------------------------------------------------------------- {{{1
" LEAVE AT END OF FILE
" Global variable to signal the functions have been sourced.
let g:ppx_functions = 1
