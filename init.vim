set nocompatible

" Required:
set runtimepath+=/home/paspartout/.nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/paspartout/.nvim/dein')
  call dein#begin('/home/paspartout/.nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/paspartout/.nvim/dein/repos/github.com/Shougo/dein.vim')
  " call dein#add('vim-syntastic/syntastic')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('tweekmonster/deoplete-clang2')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('neomake/neomake')
  call dein#add('tpope/vim-fugitive')
  call dein#add('jlevesy/rust.vim')
  call dein#add('racer-rust/vim-racer')
  call dein#add('tomvanderlee/vim-kerboscript')

  call dein#add('ctrlpvim/ctrlp.vim')

  " Currenlty not used: 
  " call dein#add('zah/nim.vim')
  " call dein#add('dpelle/vim-LanguageTool')
  " call dein#add('fatih/vim-go')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Deoplete Config
let g:deoplete#enable_at_startup = 1

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

" terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

