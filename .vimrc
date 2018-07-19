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
" print a tab using 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set listchars=tab:▸\ ,eol:¬

" UI settings
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " hight matching {[()}]
set ruler " show ruler(line and column number bottom right)
set mouse=a " use mouse if possible
set background=dark " my terminal is using a dark background

" Folding
set foldenable " enable folding feature
set foldlevel=10 " dont fold automatically
set foldmethod=syntax " fold using syntax of language

" Enable omnicomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Always display status line
set laststatus=2

" Automatically indent the right file
filetype indent on

" ============================== Custom keybinds  =============================

let mapleader=" " " use space as leader
inoremap jk <esc> " map jk to espace
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>n :set number!<CR>
nnoremap <leader>m :set relativenumber!<CR>
nnoremap <leader>l :set list!<CR>
nnoremap <leader>b :make<CR>
nnoremap <leader><leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader><leader>r :so $MYVIMRC<CR>

" fzf.vim mappings
nnoremap <c-p> :Files<CR>
nnoremap <c-t> :Tags<CR>
nnoremap <c-b> :Buffers<CR>
nnoremap <c-h> :History<CR>

" Movement
nnoremap j gj
nnoremap k gk

" Ctrl-C copies to system clipboard
vnoremap <C-c> "+y

" Use gn and gp vor navigating quickfix list
nnoremap gn :cnext<cr>
nnoremap gp :cprev<cr>

" Escape terminal using <Esc><Esc>
if exists(':tnoremap')
	tnoremap <Esc><Esc> <C-\><C-n>
endif

" Enalbe viewing manpages in vim
runtime ftplugin/man.vim

" ============================== Plugins ======================================
if exists('*minpac#init')
	call minpac#init({"verbose": 3})
	call minpac#add('k-takata/minpac', {'type': 'opt'})

	" Plugins
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('junegunn/fzf')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('vimwiki/vimwiki')
	call minpac#add('cocopon/vaffle.vim')
	call minpac#add('chrisbra/unicode.vim')
	call minpac#add('fatih/vim-go')
	call minpac#add('sedm0784/vim-you-autocorrect')
endif

" Plugin configurations

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

" vimwiki
let g:vimwiki_list = [{'path': '~/pim/wiki', 'syntax': 'markdown', 'ext': '.md'}, {'path': '~/uni/wiki', 'syntax': 'markdown', 'ext': '.md'}]

" vim-go
let g:go_fmt_command = "goimports"
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" python
autocmd FileType python nmap <leader>r :exec '!python3' shellescape(@%, 1)<cr>
