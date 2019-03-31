" Try to force using 256 colors.
if (&term =~ "xterm") || (&term =~ "screen")
    set t_Co=256
endif

" Enable syntax highlithing if terminal supports colors.
if &t_Co > 8
    syntax on
endif

" make sure functions are sourced
if g:ppx_functions == 0
    source $PPXFUN
endif

" Load colorscheme if present and 256 colors supported.
if &t_Co == 256
    set background=dark
    if functions#colorscheme('badwolf')
        colorscheme badwolf
    endif
endif

" Indentation and tabs settings
set tabstop=4       " number of columns for <Tab>
set softtabstop=4   " <Tab> columns for editing operations
set shiftwidth=4    " number of spaces for indentation
set expandtab       " replace <Tab> with spaces

" LEAVE AT END OF FILE
" Global variable to signal settings have been sourced.
let g:ppx_settings = 1
