" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"		   for Unix:  ~/.vimrc
"		  for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"		  for Haiku:  ~/config/settings/vim/vimrc
"		for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

" For all text files set 'textwidth' to 78 characters.
" autocmd FileType text setlocal textwidth=78
" augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" -------------------------------------------------------"

" ***  python vim setting and my old vim setting! ***
" if has ("syntax")
"     syntax on
" endif
filetype indent plugin on   " 파일 종류에 따른 구문 강조
" set hlsearch
" set nu
set tabstop=4
" set softtabstop=4
" set expandtab
set shiftwidth=4
set autoindent
set smartindent
" set smartcase
set cindent
set smarttab
set fileencodings=utf-8,euc-kr
set fencs=ucs-bom,utf-8,euc-kr

" -------------------------------------------------------"

" Other Program Settings
set title " 타이틀바에 현재 편집중인 파일 표시
set showcmd " 부분적인 명령어 상태라인에 표시
set ruler " 상태표시줄에 커서 위치 보여줌
set vb " 비주얼벨 사용
" set km=startsel,stopsel " SHIFT로 선택 영역 만들기 허용
set wrap
set linebreak
" set paste " 붙여넣기 설정
set nobackup " 백업파일 삭제
set showmatch   " 매칭되는 괄호 보여줌
" set wmnu    " tab 눌렀을 때 자동완성 가능한 목록

" Markdown 문법 설정 (Git 에서 사용)
augroup markdown
    " remove previous autocmds
    autocmd!
    " set every new or read *.md buffer to use the markdown filetype
    autocmd BufRead,BufNew *.md setf markdown
augroup END

" 하이라이트 끄기
nnoremap <esc><esc> :noh<return>

" system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" 한 줄 씩 이동
nnoremap k gk
nnoremap j gj

" arrow keys keymapping w/ h j k l
" nnoremap <LEFT>		h
" nnoremap <RIGHT>	l
nnoremap <UP>		gk
nnoremap <DOWN>		gj
" inoremap <LEFT>		<C-O>h
" inoremap <RIGHT>	<C-O>l
" inoremap <UP>		<C-O>gk
" inoremap <DOWN>		<C-O>gj

" cursor last word
set ve+=onemore
noremap $ $l

set clipboard=unnamed
set noimd
set linespace=3
set encoding=utf-8
set fileencoding=utf-8
set guifont=D2Coding:h12:cHANGEUL:qDEFAULT
set guifont=D2Coding:h12:cANSI:qDEFAULT
set guifontwide=D2Coding:h14

" buffer movement
nnoremap <C-q> :bprevious!<CR>
nnoremap <C-e> :bnext!<CR>
"
" Ctrl+ww = 버퍼 간 움직이기!
" :enew = 새로운 버퍼 생성
" :bd = 버퍼 닫기

" vim buffer down with NERDTree
nnoremap bq :bp<CR>:bd #<CR>
nnoremap be :enew<CR>

" excute C compile && python for algorithm
nnoremap cc :execute '!make; ./app.out < input.txt > output.txt'
nnoremap pp :execute '!python main.py < input.txt > output.txt'

" autoread
set autoread
au CursorHold * checktime

" split buffers
" set splitbelow
set splitright

" change buffer size
nmap <silent> <C-w><C-k> :resize +5<CR>
nmap <silent> <C-w><C-j> :resize -5<CR>
nmap <silent> <C-w><C-l> :vertical resize -5<CR>
nmap <silent> <C-w><C-h> :vertical resize +5<CR>

" vim-multiple-cursor
let g:multi_cursor_use_default_mapping=0

" vim-multiple-cursor Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" smooth mouse scroll
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" cursor initial setting
autocmd VimLeave * let &t_me="\<Esc>]50;CursorShape=1\x7"
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[5 q" "EI = NORMAL mode (ELSE)
set ttimeout
set ttimeoutlen=1
set ttyfast

" nerd-tree setting
nmap <F9> :NERDTreeToggle<CR>

" making own command: delede bracket
" nmap <silent> <C-[> yi(va(p<CR>

" autocomplete bracket
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" -------------------------------------------------------"

" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

"" Try to prevent bad habits like using the arrow keys for movement. This is
"" not the only possible bad habit. For example, holding down the h/j/k/l keys
"" for movement, rather than using more efficient movement commands, is also a
"" bad habit. The former is enforceable through a .vimrc, while we don't know
"" how to prevent the latter.
" Do this in normal mode...
"nnoremap <Left>  :echoe 'Use h'<CR>
"nnoremap <Right> :echoe 'Use l'<CR>
"nnoremap <Up>    :echoe 'Use k'<CR>
"nnoremap <Down>  :echoe 'Use j'<CR>
"" ...and in insert mode
"inoremap <Left>  <ESC>:echoe 'Use h'<CR>
"inoremap <Right> <ESC>:echoe 'Use l'<CR>
"inoremap <Up>    <ESC>:echoe 'Use k'<CR>
"inoremap <down>  <esc>:echoe 'use j'<cr>

" -------------------------------------------------------"

" CtrlP settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" set no undofile
if has ('persistent_undo')
    set undodir=$HOME/.vim/undo
    set undofile
endif

" -------------------------------------------------------"

"https://myeongjae.kim/blog/2016/10/06/vimlinux-4-%ED%94%8C%EB%9F%AC%EA%B7%B8%EC%9D%B8-%EB%A7%A4%EB%8B%88%EC%A0%80%EB%A5%BC-%EC%84%A4%EC%B9%98%ED%95%98%EA%B3%A0-vim-airline-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0

" Color Setting
set termguicolors

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" vim-syntastic
Plugin 'scrooloose/syntastic'

" nerd-tree
Plugin 'scrooloose/nerdtree'

" vim-multiple-cursor
Plugin 'terryma/vim-multiple-cursors'

" vim-smooth-scroll
Plugin 'terryma/vim-smooth-scroll'

" vim-current-word
Plugin 'dominikduda/vim_current_word'

" vim colorscheme: gruvbox
Plugin 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox

" vim delimitMate
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr=1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo at http://vim-scripts.org/vim/scripts.html; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" for vim-airline
let g:airline#extensions#tabline#enabled = 1			  " turn on buffer list
let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

