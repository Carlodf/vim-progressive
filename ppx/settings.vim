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

if &t_Co == 256
    set background=dark
    if functions#colorscheme('solarized')
        let g:solarized_visibility='low'
        let g:solarized_termcolors=256
        colorscheme solarized
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

if v:version > 703 || (v:version == 703 && has('patch541'))
    " remove comment leader when joining lines
    set formatoptions+=j
endif

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

" Allows to recursively search files in subdirectoried of the current work
" directory.
if has('path_extra')
    set path+=**/*
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

" jedi settings----------------------------------------------------------- {{{1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>gd"
let g:jedi#goto_assignments_command = "<leader>gg"
let g:jedi#goto_definitions_command = "<leader>g]"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>gu"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>gr"

" status line ------------------------------------------------------------ {{{1
if exists('g:loaded_fugitive')
    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

" Metadata files---------------------------------------------------------- {{{1

" managing various vim meta-data files (viminfo, backup, swp, undo)
if !has('nvim') && isdirectory($PPXTMP)
    let $INFOPATH = $PPX . '/viminfo'
    let $PPXBKP = $PPX . '/backup'
    let $PPXDIR= $PPX . '/swp'
    let $PPXUNDO= $PPXDIR . '/undo'

    " echo an error message if the info file is not readable
    if !empty(glob(expand($INFOPATH)))
        if !filereadable($INFOPATH)
            echoerr expand('warning: ' . $INFOPATH . ' not readable')
        endif
    endif

    set viminfo+=n$INFOPATH " set custom directory for info files

    if exists('$sudo_user')
        set nobackup                    " avoid root-owned files
        set nowritebackup               " avoid root-owned files
        set noswapfile                  " avoid root-owned files
    else
        set backupdir=$PPXBKP " custom dir for backup files
        set directory=$PPXDIR " custom dir for swap files
    endif

    if has('persistent_undo')
        " automatically save undo history to an undo file
        set udf
        set udir=$PPXUNDO " custom dir for undo files
    endif
endif


" EOF--------------------------------------------------------------------- {{{1

" LEAVE AT END OF FILE
" Global variable to signal settings have been sourced.
let g:ppx_settings = 1
