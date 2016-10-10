" will not be compatible with vi
set nocompatible

" Startup {{{
filetype indent plugin on

augroup vimautocmds
	autocmd!

	" set local foldmethod to marker
	autocmd FileType vim setlocal foldmethod=marker

	" locate the cursor on last exit
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\	exe "normal g'\"" |
				\ endif

	" indent html file before save to the disk
	autocmd BufWritePre *.html :normal gg=G

	autocmd FileType c,cpp,h,cs,java,css,js,nginx,scala,go,vim inoremap <buffer> {<CR> {<CR>}<Esc>O

augroup END

" }}}

" Generals {{{

" general settings about vim, regardless platforms or GUI mode

" enablesyntax highlight
syntax on

" set color for all platforms
colorscheme molokai

set backspace=2
set autoindent
set smartindent
set number
set ruler
set autochdir
set scrolloff=5
set autoread
set laststatus=2
set list lcs=tab:\|\ ,trail:.
set nolist
set modeline
set completeopt=longest,menu

" highlight line && column
set cursorline
set cursorcolumn

set showmatch
set matchtime=0

" set fold method, fmd: syntax, marker, manual...
set foldmethod=syntax
set foldcolumn=0
set foldlevel=100

" searching
set ignorecase
" if the pattern contains an uppercase, it's case sensitive
set smartcase
" incremental search
set incsearch
" highlight results
set hlsearch

" share clipboard with other application
set clipboard+=unnamed

" tab control {{{
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
" }}}

" }}}


" detect platform and gui {{{

" detect on which system vim is running
let g:isWIN = 0
let g:isMAC = 0
let g:isLNX = 0

if (has('win32') || has ('win64'))
	" vim is running under Windows
	let g:isWIN = 1

elseif system('uname') =~ 'Darwin'
	" vim is running under OS X
	let g:isMAC = 1

elseif system('uname -s') =~ 'Linux'
	" vim is running under Linux
	let g:isLNX = 1
endif

" detect if vim is running in GUI mode
if (has('gui_running'))
	let g:isGUI = 1
else
	let g:isGUI = 0
end
" }}}

" platform and gui settings {{{

" plugin path, platform depend settings
if g:isWIN
	set fileformat=dos
	set fileformats=dos,unix,mac
	let g:plugin_path = $VIM."\\vimfiles\\bundle\\"

elseif g:isLNX
	set fileformat=unix
	set fileformats=unix,dos,mac
	let g:plugin_path = "~/.vim/bundle/"

elseif g:isMAC
	" TODO: modify this param!
	set fileformat=mac
	set fileformats=mac,unix,dos
	let g:plugin_path = "~/.vim/bundle/"
endif

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

		" don't map atl key to open menus.
		set winaltkeys=no

	elseif g:isLNX
		" TODO: 
		set guifont=Courier\ New\ 14

	elseif g:isMAC
		" maybe useful later 
	endif

else		" no gui
	language messages en_US
endif

" }}}

" encodings {{{
let $LANG = 'en_US.UTF-8'
set fileencoding=utf-8
set fileencodings=usc-bom,utf-8,gbk,cp936,gb18030,euc-jp,latin-1
set encoding=utf-8
" }}}

" vim-plug init {{{
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vim-latex'
Plug 'jrosiek/vim-mark'


call plug#end()
" }}}

" plugin params {{{

set background=dark
let g:airline_powerline_fonts = 2
let g:airline_theme = "luna"
let g:rehash256 = 1

" }}}

" support for mouse
if has('mouse')
	" mouse can be used in all modes, normal, visual ...
	set mouse=a
	set selectmode=mouse,key
	set nomousehide
endif

let mapleader = ","
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
inoremap <esc> <nop>
inoremap jk <esc>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>


autocmd BufNewFile *.py call LinuxScriptHeader()
autocmd BufNewFile *.sh call LinuxScriptHeader()

" vim functions {{{
function LinuxScriptHeader()
	if &filetype == 'python'
		let header = "#!/usr/bin/env python"
		let coding = "# -*- coding:utf-8 -*-"
		let cfg = "# vim: ts=4 sw=4 sts=4 expandtab"
	elseif &filetype == 'sh'
		let header = "#/bin/bash"
	endif
	let line = getline(1)
	if line == header
		return
	endif

	normal m'
	call append(0, header)
	if &filetype == 'python'
		call append(1, coding)
		call append(2, cfg)
	endif

	normal ''
endfunction

" }}}
