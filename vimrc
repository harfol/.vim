let mapleader=" "
set shell=/bin/bash

" normal
" up
nnoremap sk <C-w>k 
" down
nnoremap sj <C-w>j
" rigth
nnoremap sl <C-w>l
"left
nnoremap sh <C-w>h
" open in the botton.
nnoremap st= :terminal<CR><C-w>J<CR>
nnoremap J 5j
nnoremap K 5k
nnoremap R :source $MYVIMRC<CR>
nnoremap Q :q<CR>
nnoremap <M-up> :m-2<CR>
nnoremap <M-down> :m+1<CR>
nnoremap <LEADER>w :w<CR>
" edit last open file
nnoremap ej :e#<CR>
nnoremap ek :e#<CR>
" tab
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

" terminal
" close terminatl
tnoremap st- <C-w>:quit!<CR>
" up
tnoremap sk <C-w>k
" down
tnoremap sj <C-w>j
" rigth
tnoremap sl <C-w>l
"left
tnoremap sh <C-w>h



" set cursorcolumn
set cursorline
set number
set tabstop=4
set sw=4
syntax on
"set relativenumber
set backspace=indent,eol,start
packadd termdebug
set nowrap
" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set autochdir


call plug#begin('~/.vim/plugged')

" 进度条 
Plug 'vim-airline/vim-airline'
" 主题
Plug 'connorholyday/vim-snazzy'
" 函数栏 
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" 导航栏 
Plug 'preservim/nerdtree'
" Taglist
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" let g:SnazzyTransparent = 1
color snazzy

map tr :NERDTreeRefreshRoot<CR>
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "h"
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = "u"
let NERDTreeMapCloseDir = "c"
let NERDTreeMapChangeRoot = "l"
let NERDTreeShowHidden=1

" map tg :TagbarToggle<CR>
map tg :TagbarOpenAutoClose<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30

" ycm
nnoremap gj :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap gd :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gk :YcmCompleter GoToReferences<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_python_interpreter_path = "/usr/bin/python3"
let g:ycm_python_binary_path = "/usr/bin/python3"



