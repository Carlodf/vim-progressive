
" Checks if colorscheme file exists.
function! functions#colorscheme(name)
    let color_path = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, color_path))
endfunction

" LEAVE AT END OF FILE
" Global variable to signal the functions have been sourced.
let g:ppx_functions = 1
