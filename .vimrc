" Thanks to http://dougblack.io/words/a-good-vimrc.html for his great
" guide to write a vimrc

" General config
set nocompatible " No vi compatible mode
set history=256 " Number of things to remember in history

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Search settings
set hlsearch " highlight search results
set ignorecase
set smartcase
set incsearch

" Formatting
syntax enable " enable syntax highlighting
" TODO: Check how files are formatted
set tabstop=4 " a tab equals 4 spaces
set softtabstop=4

" UI settings
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " hight matching {[()}]
set ruler " show ruler(line and column number bottom right)
set mouse=a " use mouse if possible

" Folding
set foldenable " enable folding feature
set foldlevel=10 " dont fold automatically
set foldmethod=syntax " fold using syntax of language

" Enable omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Always display status line
set laststatus=2

" ============================== Custom keybinds  =============================

let mapleader=" " " use space as leader
inoremap jk <esc> " map jk to espace
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>n :set number!<CR>
nnoremap <leader><leader>v :edit $MYVIMRC<CR>
nnoremap <leader><leader>r :so $MYVIMRC<CR>

" Movement
nnoremap j gj
nnoremap k gk

" Ctrl-C copies to system clipboard
vnoremap <C-c> "+y

" Escape terminal using <Esc><Esc>
if exists(':tnoremap')
	tnoremap <Esc><Esc> <C-\><C-n>
endif

" ============================== Plugins ======================================
if exists('*minpac#init')
	call minpac#init({'verbose' : 3})
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Plugins
	call minpac#add('ctrlpvim/ctrlp.vim')
	call minpac#add('tpope/vim-surround')
	call minpac#add('ervandew/supertab')
	call minpac#add('tchyny/lightline.vim')
	call minpac#add('tpope/vim-fugitive')

	" Optional Plugins
	call minpac#add('vimwiki/vimwiki', {'type': 'opt'})
endif


command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
