" set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Add neovim only plugins
if exists('*minpac#init')
	call minpac#add('autozimu/LanguageClient-neovim', {'do': './install.sh'})
	call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
endif

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" deoplete enalbe omni completion
let g:deoplete#enable_at_startup = 1

nnoremap <silent> ö :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gh :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_rename()<CR>

