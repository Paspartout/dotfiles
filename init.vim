" Thanks to http://dougblack.io/words/a-good-vimrc.html for his great
" guide to write a vimrc

set nocompatible
set history=256 " Number of things to remember in history

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,~/in

" Custom Leader Shortcuts
let mapleader="," " leader is comma
inoremap jk <esc> " map jk to espace

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
set shiftwidth=4

" UI settings
"set number " Show line numbers
set showcmd " show command in bottom bar
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " hight matching {[()}]
set ruler " show ruler(line and column number bottom right)
set mouse=a

" Folding
set foldenable " enable folding feature
set foldlevelstart=10 " Only fold blocks that are larger than 10 lines
set foldnestmax=10 " max 10 nested folds
set foldmethod=syntax
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
" highlight last inserted text
nnoremap gV `[v`]

" Required:
set runtimepath+=/home/paspartout/.nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/paspartout/.nvim/dein')
  call dein#begin('/home/paspartout/.nvim/dein')

  " Let dein manage dein
  call dein#add('/home/paspartout/.nvim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/deoplete.nvim')
  " call dein#add('tweekmonster/deoplete-clang2')

  call dein#add('zchee/deoplete-jedi')

  call dein#add('neomake/neomake')

  call dein#add('tpope/vim-fugitive')
  call dein#add('tomvanderlee/vim-kerboscript')

  call dein#add('ctrlpvim/ctrlp.vim')

  call dein#add('jlevesy/rust.vim')
  call dein#add('autozimu/LanguageClient-neovim')

  " Currenlty not used: 
  " call dein#add('zah/nim.vim')
  " call dein#add('dpelle/vim-LanguageTool')
  " call dein#add('fatih/vim-go')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Map CTRL-C and to copy to clipboard
vnoremap <C-c> "+y

" Nvim terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

" ================================================================
" Plugin Configurations
" ================================================================

" Deoplete Config
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#executable = '/usr/bin/clang'

" Use Tab for completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Pyhton completion
let g:deoplete#sources#jedi#python_path = "/usr/bin/python3"

set hidden
let g:racer_cmd = "/home/paspartout/.cargo/bin/racer"

" CtrlP config
let g:ctrlp_root_markers = ['Makefile', 'Cargo.toml']

filetype plugin indent on
syntax enable

" LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

