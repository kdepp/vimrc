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
nmap <leader>f :MRU<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gd :Git diff<CR>

" show the extra status line
set laststatus=2
function! CurDir()
	let curdir = substitute(getcwd(), '/home/peter', "~/", "g")
	return curdir
endfunction
" define the status line content
set statusline=\ %f%m%r%h\ %w\ %<CWD:\ %{CurDir()}\ %=Pos:\ %l/%L:%c\ %p%%\ 

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
