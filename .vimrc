" Thanks to http://dougblack.io/words/a-good-vimrc.html for his great
" guide to write a vimrc

" General config
set nocompatible " No vi compatible mode
set history=256 " Number of things to remember in history

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Vundle plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'altercation/vim-colors-solarized'
    " Fuzzy maching ftw
    Plugin 'kien/ctrlp.vim'
    "
    " Awesome plugin for git
    " TODO: Include once used
    " Plugin 'tpope/vim-fugitive'
    "
    " Nice and light bottom line
    " TODO: Figure out fonts and include
    " Plugin 'bling/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required

" Settings for vim-taskwarrior
let g:task_rc_override = 'rc.defaultwidth=0'
let g:task_rc_override = 'rc.defaultheight=0'

" Use Solarized Dark Theme
set background=dark
colorscheme solarized

" Search settings
set hlsearch " highlight search results
set ignorecase
set smartcase
set incsearch
"" turn off search highlight by pressing ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" Formatting
syntax enable " enable syntax highlighting
set tabstop=4 " a tab equals 4 spaces
set softtabstop=4

" UI settings
set number " Show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " hight matching {[()}]
"" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Folding
set foldenable " enable folding feature
set foldlevelstart=10 " Only fold blocks that are larger than 10 lines
set foldnestmax=10 " max 10 nested folds
set foldmethod=syntax " TODO: more testing on that
"" space to open/close folds
nnoremap <space> za

" Movement
"" move vertically by visual line
"" this solves the problem when moving to "fake" parts of visual lines
nnoremap j gj
nnoremap k gk
"" move to beginning/end of line
nnoremap B ^
nnoremap E $
"" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]

" Custom Leader Shortcuts
let mapleader="," " leader is comma
inoremap jk <esc> " map jk to espace
