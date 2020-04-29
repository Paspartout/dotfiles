let &packpath = &runtimepath
source ~/.vimrc

" Add neovim only plugins
if exists('*minpac#init')
	" call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
	call minpac#add('Shougo/neosnippet.vim')
	call minpac#add('Shougo/neosnippet-snippets')
	" call minpac#add('tbodt/deoplete-tabnine')
	call minpac#add('neomake/neomake')
	call minpac#add('neoclide/coc.nvim')
endif

" coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" neomake
let g:neomake_python_enabled_makers = ['pyflakes']
let g:neomake_go_gometalinter_args = ['--fast']

autocmd FileType go :call neomake#configure#automake('w')
autocmd FileType python :call neomake#configure#automake('nw', 250)

