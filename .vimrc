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
set wildmenu
" highlight the current line
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

" coffeescript auto fold
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" customized hotkey
nnoremap <leader>w :w!<cr>
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <Down> :bn<CR>:bd #<CR>
nnoremap ` <C-Y>
nnoremap <Space> <C-E>
nnoremap <F8> :TrinityToggleNERDTree<CR>
nnoremap <F7> <F8>:cw<CR>
nnoremap <F6> :ccl<CR><F8>
nnoremap <leader>f :MRU<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <C-J> ddp
nnoremap <C-K> ddkP

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
