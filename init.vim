let &packpath = &runtimepath
source ~/.vimrc

" Add neovim only plugins
if exists('*minpac#init')
	call minpac#add('autozimu/LanguageClient-neovim', {'do': './install.sh'})
	call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
	call minpac#add('Shougo/neosnippet.vim')
	call minpac#add('Shougo/neosnippet-snippets')
	call minpac#add('zchee/deoplete-jedi')
	call minpac#add('zchee/deoplete-go', {'do': 'make'})
	call minpac#add('neomake/neomake')
endif

" language client
nnoremap <silent> ö :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gh :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
let g:LanguageClient_autoStart = 0
let g:LanguageClient_loadSettings = 1

" deoplete enalbe omni completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" neomake
let g:neomake_python_enabled_makers = ['pyflakes']
let g:neomake_go_gometalinter_args = ['--fast']

autocmd FileType go :call neomake#configure#automake('w')
autocmd FileType python :call neomake#configure#automake('nw', 250)

