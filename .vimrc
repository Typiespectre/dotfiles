"          _                    
"   __   _(_)_ __ ___  _ __ ___ 
"   \ \ / / | '_ ` _ \| '__/ __|
"    \ V /| | | | | | | | | (__ 
"   (_)_/ |_|_| |_| |_|_|  \___|
"   
" Maintainer: sideseal
" ------------------------------

" 1. System preference
set nocompatible
syntax on
set termguicolors
set number
set nuw=5
set relativenumber
set title
set showtabline=2
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set showcmd
set ruler
set nobackup
set noswapfile
set noerrorbells visualbell t_vb=
set vb
set mouse+=a
set noimd
set splitright
set backspace=indent,eol,start
" set hidden

set ve+=onemore
noremap $ $l

set wrap
set linebreak

set clipboard=unnamedplus
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

augroup markdown
	autocmd!
	autocmd BufRead,BufNew *.md setf markdown
augroup END
set nofoldenable

set hlsearch
set incsearch
set showmatch
nnoremap <esc><esc> :noh<return>
set ignorecase
set smartcase
set nows

sy enable
filetype indent plugin on
set autoindent
set smartindent
set cindent
set smarttab
set fileencodings=utf-8,euc-kr
set fencs=ucs-bom,utf-8,euc-kr
set guifont=D2Coding:h12:cHANGEUL:qDEFAULT
set guifont=D2Coding:h12:cANSI:qDEFAULT
set guifontwide=D2Coding:h14

nnoremap k gk
nnoremap j gj
nnoremap <UP>	gk
nnoremap <DOWN>	gj

autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7"
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[5 q" "EI = NORMAL mode (ELSE)
set ttimeout
set ttimeoutlen=1
set ttyfast


" 2. Personal settings

command Openio :vsplit output.txt | :split input.txt
nnoremap cc :execute '!make; ./app.out < input.txt > output.txt'<CR>
nnoremap pp :execute '!python main.py < input.txt > output.txt'<CR>

set autoread
au CursorHold * checktime

let mapleader = "g"
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>

" let mapleader = "w"
" nmap <leader>h :vertical resize -5<CR>
" nmap <leader>l :vertical resize +5<CR>
" nmap <leader>k :resize +5<CR>
" nmap <leader>j :resize -5<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_fastbrowse = 0
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END
nnoremap <TAB> :Vexplore %:p:h<CR>
autocmd FileType netrw nnoremap <buffer> <TAB> :bd<CR>


" 0. Tips to remember
" 10^w< 	-> decrease buffer size (vertically)
" 10^w>		-> increase buffer size (vertically)
" 10^w+		-> increase buffer size (horizontally)
" 10^w-		-> decrease buffer size (horizontally)
" ^w=		-> equal buffer size
