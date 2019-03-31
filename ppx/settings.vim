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

" LEAVE AT END OF FILE
" Global variable to signal settings have been sourced.
let g:ppx_settings = 1
