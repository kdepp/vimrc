" use pathongen to load plugin bundle
execute pathogen#infect()
" show syntax color
syntax on
" detect file type, and load the indent & plugin for specific file types
filetype plugin indent on

" no backup file
set nobackup
" no swap file
set noswapfile
" show row & col 
set ruler
" show command in normal mode
set showcmd
" shiftwidth = 4
set sw=4
" tabstop = 4
set ts=4
" expand tab
set et
" reserve N lines scrolloff while moving up/down 
set so=3
" in command mode, press wildchar (<Tab>) to show tips, <C-P>/<C-N> to move around
" highlight the current line
set wildmenu
set cursorline
" highlight the current column
set cursorcolumn
" show no line number in default
set nonu
" highlight search words
set hls
" increasing search
set incsearch

" set encodings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
set langmenu=zh_CN,utf-8

" leader key
let mapleader = ","
let g:mapleader = ","

" auto fold
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2

" javascript auto fold
let javaScript_fold=1

" javascript auto setting
augroup javascript
    autocmd!
    " Comment a block of js
    autocmd BufNewFile,BufReadPost *.js vnoremap <leader>c :normal i//<CR>
    " Uncomment a block of js
    autocmd BufNewFile,BufReadPost *.js vnoremap <leader>C :normal xx<CR>
    autocmd BufNewFile,BufReadPost *.js nnoremap <leader>C :execute "normal :set hls!\r?^[^\/]*$\rjV/^[^\/]*$\rk"<CR>:normal xx<CR>:execute "normal /%%^###@@@%\r:set hls\r"<CR>
augroup END

" coffeescript auto setting
augroup coffee
    autocmd!
    autocmd BufNewFile,BufReadPost *.coffee,Cakefile setl foldmethod=indent nofoldenable
    " Comment a block of coffee
    autocmd BufNewFile,BufReadPost *.coffee,Cakefile vnoremap <leader>c :normal i#<CR>
    " Uncomment a block of coffee
    autocmd BufNewFile,BufReadPost *.coffee,Cakefile vnoremap <leader>C :normal x<CR>
    autocmd BufNewFile,BufReadPost *.coffee,Cakefile nnoremap <leader>C :execute "normal :set hls!\r?^[^#]*$\rjV/^[^#]*$\rk"<CR>:normal x<CR>:execute "normal /%%^###@@@%\r:set hls\r"<CR>
augroup END

" html auto setting
augroup html
    autocmd!
    " manual fold
    autocmd BufNewFile,BufReadPost *.html setl foldmethod=manual
    " fold a block of html
    autocmd FileType html nnoremap <buffer> <leader>z Vatzf
    " Comment a block of html
    autocmd FileType html vnoremap <leader>c <ESC>`<O<!--<ESC>`>o<ESC>I--><ESC>
    " Uncomment a block of html
    autocmd FileType html vnoremap <leader>C <ESC>`<dd`>dd
    autocmd FileType html nnoremap <leader>C :execute "normal ?^<!--\rdd/^-->\rdd"<CR>
augroup END

" customized hotkey
vnoremap <Space> <ESC>
nnoremap <Space> <ESC>
onoremap <Space> <ESC>
nnoremap <leader>w :w!<CR>
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <Down> :bn<CR>:bd #<CR>
nnoremap <F8> :TrinityToggleNERDTree<CR>
nnoremap <F7> :botr cw<CR>
nnoremap <F6> :ccl<CR>
nnoremap <leader>f :MRU<CR>
nnoremap <C-J> ddp
nnoremap <C-K> ddkP
" Edit the vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Source the vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" Turn the last word to upper case
inoremap <c-u> <ESC>bvwUea
" Double Quote the word
nnoremap <leader>" viw<ESC>bi"<ESC>ea"<ESC>
" Single Quote the word
nnoremap <leader>' viw<ESC>bi'<ESC>ea'<ESC>
vnoremap <leader>' <ESC>`<i'<ESC>`>la'<ESC>
" Exit insert mode
inoremap jk <ESC>
inoremap <ESC> <nop>
" Operator Mapping, email
onoremap i@ :execute "normal! /\\w\\+\\(\\.\\w\\+\\)*@\\(\\w\\+\\.\\)\\+\\w\\+\rv//e\r"<CR>
" Sudo write
cmap w!! w !sudo tee > /dev/null %

nnoremap <leader>vv :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> botr cw<CR>
nnoremap <leader>VV :execute "vimgrep /" . shellescape(expand("<cWORD>")) . "/j **" <Bar> botr cw<CR>
nnoremap <leader>v :set operatorfunc=GrepOperator<CR>g@
vnoremap <leader>v :<c-u>call GrepOperator(visualmode())<CR>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    execute "vimgrep /" . @@ . "/j **" | botr cw
endfunction

" show the extra status line
set laststatus=2
function! CurDir()
	let curdir = substitute(getcwd(), '/Users/kdepp', "~/", "g")
	return curdir
endfunction
" define the status line content
" set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ %=Pos:\ %l/%L:%c\ %p%%\ 

" settings for EasyMotion
if !exists("g:EasyMotion_loaded")
	let g:EasyMotion_do_mapping = 0 " Disable default mappings

	" Bi-directional find motion
	" Jump to anywhere you want with minimal keystrokes, with just one key binding.
	" `s{char}{label}`
	nmap s <Plug>(easymotion-s)
	" or
	" `s{char}{char}{label}`
	" Need one more keystroke, but on average, it may be more comfortable.
	nmap s <Plug>(easymotion-s2)

	" Turn on case sensitive feature
	let g:EasyMotion_smartcase = 1

	" JK motions: Line motions
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)
endif

" settings for coffeelint
if exists("g:loaded_syntastic_coffee_coffeelint_checker")
    let g:syntastic_coffee_coffeelint_args = "--report csv --file ~/coffeelint.json"
endif

colorscheme desert
