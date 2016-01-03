" will not be compatible with vi
set nocompatible

" detect on which system vim is running
if (has('win32') || has ('win64'))
	" vim is running under Windows
	let g:isWIN = 1
	let g:isMAC = 0

	" behave like MS Windows
	source $VIMRUNTIME/mswin.vim
	behave mswin
else
	if system('uname') =~ 'Darwin'
		" vim is running under OS X
		let g:isWIN = 0
		let g:isMAC = 1
	else
		" vim is running under Linux or other systems
		let g:isWIN = 0
		let g:isMAC = 0
	endif
endif

" detect if vim is running in GUI mode
if (has('gui_running'))
	let g:isGUI = 1
else
	let g:isGUI = 0
end

" encodings
set fenc=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1,usc-bom,euc-jp
set encoding=utf-8
set fileformat=dos
set fileformats=dos,unix,mac

" set color for all platforms
colorscheme molokai

" set guifont if under GUI mode
if g:isGUI

	" close menus and toolbars in GUI mode
	set guioptions-=T		" hide toolbar
	set guioptions-=L		" hide left scroll bar
	set guioptions-=r		" hide right scroll bar
	set guioptions-=m		" hide menu
	set guioptions-=b		" hide bottom scroll bar

	set guioptions+=c		" show character box ?

	if g:isWIN
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language messages zh_CN.utf-8

		set guifont=Source\ Code\ Pro:h14
		" share clipboard with windows
		set clipboard+=unnamed
		" plugin file path
		" let g:plugin_path = strpart($VIMRUNTIME, 0, strridx($VIMRUNTIME, "\\")+1)."vimfiles\\bundle\\"

		let g:plugin_path = $VIM."\\vimfiles\\bundle\\"
	elseif g:isMAC
		" 
	else
		" TODO: 
		let g:plugin_path = "~/.vim"
	endif
else		" no gui
	language messages en_US
endif

syntax on			" enablesyntax highlight
filetype on			" detect file type
filetype plugin on	" load plugin files
filetype indent on	" load indent files for certain file type

" vim-plug init
call plug#begin(g:plugin_path)

" plugin list
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
" Plug 'Valloric/YouCompleteMe'

Plug 'mattn/emmet-vim'
Plug 'bigeagle/molokai'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'klen/python-mode'
Plug 'kien/rainbow_parentheses'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'lervag/vim-latex'
Plug 'jrosiek/vim-mark'


call plug#end()
" support for mouse
if has('mouse')
	set mouse=a					" mouse can be used in all modes, normal, visual ...
	set selectmode=mouse,key
	set nomousehide
endif

" locate the cursor on last exit
if has("autocmd")
	autocmd BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\	exe "normal g'\"" |
		\ endif
endif

" general settings about vim, regardless platforms or GUI mode
set backspace=2
set autoindent
set smartindent
set number
set ruler
set autochdir
set so=10
set autoread
set laststatus=2
set list lcs=tab:\|\ ,trail:.
set nolist
set shiftwidth=4
set tabstop=4
set softtabstop=4
set modeline
set completeopt=longest,menu

" highlight line && column
set cursorline
set cursorcolumn

set showmatch
set matchtime=0

set foldmethod=syntax
set foldcolumn=0
set foldlevel=100

" searching
set ignorecase
set smartcase			" if the pattern contains an uppercase, it's case sensitive
set incsearch			" incremental search
set hlsearch			" highlight results

au FileType c,cpp,h,java,css,js,nginx,scala,go,vim inoremap <buffer> {<CR> {<CR>}<Esc>O

let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>i"<esc>hbi"<esc>lel
inoremap jk <esc>
inoremap <esc> <nop>
autocmd BufWritePre *.html :normal gg=G
