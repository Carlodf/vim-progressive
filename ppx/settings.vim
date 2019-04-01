" SETTINGS

" Syntax and colors------------------------------------------------------- {{{1
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
    let &colorcolumn="80,".join(range(120,120),",")
endif


" Text formatting--------------------------------------------------------- {{{1

" Indentation and tabs settings
set tabstop=4       " number of columns for <Tab>
set softtabstop=4   " <Tab> columns for editing operations
set shiftwidth=4    " number of spaces for indentation
set expandtab       " replace <Tab> with spaces


" Windows managment------------------------------------------------------- {{{1
if has('vertsplit')
    set splitright " vertical split defaults to the right
endif

if has('windows')
    set splitbelow " orizontal split defaults below
endif

" Metadata files---------------------------------------------------------- {{{1

" managing various vim meta-data files (viminfo, backup, swp, undo)
if isdirectory('/home/pappix/.vim/tmp')

    " echo an error message if the info file is not readable
    if !empty(glob(expand('/home/pappix/.vim/tmp/viminfo')))
        if !filereadable('/home/pappix/.vim/tmp/viminfo')
            echoerr expand('warning: /home/pappix/.vim/tmp/viminfo not readable')
        endif
    endif

    set viminfo+=n$ppxtmp/viminfo " set custom directory for info files

    if exists('$sudo_user')
        set nobackup                    " avoid root-owned files
        set nowritebackup               " avoid root-owned files
        set noswapfile                  " avoid root-owned files
    else
        set backupdir=/home/pappix/.vim/tmp/backup  " custom dir for backup files
        set directory=/home/pappix/.vim/tmp/swp     " custom dir for swap files
    endif

    if has('persistent_undo')
        " automatically save undo history to an undo file
        set udf
        set udir=/home/pappix/.vim/tmp/swp/undo        " custom dir for undo files
    endif
endif


" EOF--------------------------------------------------------------------- {{{1

" LEAVE AT END OF FILE
" Global variable to signal settings have been sourced.
let g:ppx_settings = 1
