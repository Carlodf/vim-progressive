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

if has('syntax')
    set cursorline
endif


" Text formatting--------------------------------------------------------- {{{1

" Indentation and tabs settings
set tabstop=4       " number of columns for <Tab>
set softtabstop=4   " <Tab> columns for editing operations
set shiftwidth=4    " number of spaces for indentation
set expandtab       " replace <Tab> with spaces

" Editor workspace descriptors
set number                              " show line number
set relativenumber                      " show relative line number
set list                                " shoe invisible characters
set listchars=tab:▸\ ,eol:¬,extends:»,precedes:«,trail:•,nbsp:‡
set laststatus=2                        " Always show status line

" Vim status bar and commands completion --------------------------------- {{{1

if has('cmdline_info')
    set ruler                           " show the cursor position all the time
    set showcmd                         " display incomplete commands
endif

if has('wildmenu')
" display completion matches in a status line
    set wildmenu
" When more than one match, list all matches and complete first match.
    set wildmode=list,full
endif

" When there is a previous search pattern, highlight all its matches.
if has('extra_search')
    set hlsearch
" Do incremental searching when it's possible to timeout.
    if has('reltime')
" Display the match for a search pattern when halfway
" typing it.
      set incsearch
    endif
endif

" Windows managment------------------------------------------------------- {{{1
if has('vertsplit')
    set splitright " vertical split defaults to the right
endif

if has('windows')
    set splitbelow " orizontal split defaults below
endif

" netrw settings---------------------------------------------------------- {{{1
let g:netrw_liststyle = 3           " tree like view
let g:netrw_banner = 0              " don't show top banner
let g:netrw_browse_split = 4        " open file in previouw viewport
let g:netrw_altv = 1                " open in vertical viewport
let g:netrw_winsize = 85            " netrw split size to 15% of the width

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
