" use pathongen to load plugin bundle
execute pathogen#infect()
" show syntax color
syntax on
" detect file type, and load the indent & plugin for specific file types
filetype plugin indent on

" no backup file
set nobackup
" show row & col 
set ruler
" show command in normal mode
set showcmd
" shiftwidth = 4
set sw=4
" tabstop = 4
set ts=4

" set encodings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=chinese
set fileencodings=ucs-bom,utf-8,chinese,cp936
set langmenu=zh_CN,utf-8

" customized hotkey
nmap <Left> :bp<CR>
nmap <Right> :bn<CR>
nmap <Down> :bn<CR>:bd #<CR>
nmap ` <C-Y>
nmap <Space> <C-E>
nmap <F8> :TrinityToggleNERDTree<CR>
nmap <F7> <F8>:cw<CR>
nmap <F6> :ccl<CR><F8>

colorscheme desert
