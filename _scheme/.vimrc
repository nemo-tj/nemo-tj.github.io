" vundle
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set nu
set showcmd
set laststatus=1
set magic
set cursorline
set mouse=a
set go=
set showmatch
set matchtime=1
set nobackup
set ruler
set autoindent
set confirm

set tabstop=2
set shiftwidth=2
set smarttab
set nocompatible
set expandtab
set backspace=indent,eol,start

set wildmenu
set fo=cqrt
set laststatus=2
set textwidth=78
" set colorcolumn=+1
" set cursorcolumn
set ww=<,>,h,l
set noeb visualbell
let mapleader = ","

filetype on
filetype plugin on
filetype indent on
syntax on
syntax enable

" encoding
set fencs=utf-8,usc-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" Molokai
" colorscheme molokai
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" some map
map <F5> :call CR()<CR>
func! CR()
    exec "w"
    exec "!g++ % -o %<"
    exec "! ./%<"
endfunc

map <F10> :call RG()<CR>
func! RG()
    exec "w"
    exec "!g++ % -g -o % <"
    exec "! ./%<"
endfunc

map <F2> :call SetTitle()<CR>
func SetTitle()
let l = 0
let l = l + 1 | call setline(l,'/******************************')
let l = l + 1 | call setline(l,' *File name: '.expand("%"))
let l = l + 1 | call setline(l,' *Author: Cap.nemo')
let l = l + 1 | call setline(l,' *Created Time: '.strftime("%c"))
let l = l + 1 | call setline(l,' *TODO:')
let l = l + 1 | call setline(l,'******************************/')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'#include <cstdio>')
let l = l + 1 | call setline(l,'#include <cstring>')
let l = l + 1 | call setline(l,'#include <cstdlib>')
let l = l + 1 | call setline(l,'#include <iostream>')
let l = l + 1 | call setline(l,'#include <string>')
let l = l + 1 | call setline(l,'#include <algorithm>')
let l = l + 1 | call setline(l,'#include <vector>')
let l = l + 1 | call setline(l,'#include <queue>')
let l = l + 1 | call setline(l,'#include <set>')
let l = l + 1 | call setline(l,'#include <map>')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'using namespace std;')
let l = l + 1 | call setline(l,'')
endfunc

map <F3> :call SetTitle2()<CR>
func SetTitle2()
let l = 0
let l = l + 1 | call setline(l,'/******************************')
let l = l + 1 | call setline(l,' *File name: '.expand("%"))
let l = l + 1 | call setline(l,' *Author: Cap.Nemo')
let l = l + 1 | call setline(l,' *Created Time: '.strftime("%c"))
let l = l + 1 | call setline(l,' *TODO:')
let l = l + 1 | call setline(l,'******************************/')
let l = l + 1 | call setline(l,'')
let l = l + 1 | call setline(l,'#include <bits/stdc++.h>')
let l = l + 1 | call setline(l,'using namespace std;')
let l = l + 1 | call setline(l,'')
endfunc

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <F6> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F7> :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
