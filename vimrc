let mapleader=" "
set shell=/bin/bash

" normal
nnoremap sk <C-w>k 
nnoremap sj <C-w>j
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" open in the botton.
nnoremap st= :terminal<CR><C-w>J<CR>
nnoremap J 5j
nnoremap K 5k
nnoremap H 5b
nnoremap L 5w
nnoremap R :source $MYVIMRC<CR>
nnoremap Q :q<CR>
nnoremap W :w<CR>
nnoremap <M-up> :m-2<CR>
nnoremap <M-down> :m+1<CR>
nnoremap ej :e#<CR>
nnoremap ek :e#<CR>
nnoremap q zz



" tab
map tn :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>
" close terminatl
tnoremap st- <C-w>:quit!<CR>
tnoremap sk <C-w>k
tnoremap sj <C-w>j
tnoremap sl <C-w>l
tnoremap sh <C-w>h

" set cursorcolumn
set cursorline " 横线
set number "行号
set tabstop=4
set sw=4
syntax on
"set relativenumber
set backspace=indent,eol,start
packadd termdebug    " debug
set nowrap    " 不换行
" 记录文件行
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" set autochdir    " 自动变更目录


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'    " 下边框条
Plug 'connorholyday/vim-snazzy'    " 主题
" 函数栏 
Plug 'godlygeek/tabular'    " markdown
Plug 'plasticboy/vim-markdown'
" 导航栏 
Plug 'preservim/nerdtree'    " 导航兰
" Taglist
Plug 'majutsushi/tagbar'    " 函数预览
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}    " coc
Plug 'puremourning/vimspector'    " 调试器
Plug 'preservim/nerdcommenter'    " 自动注释
call plug#end()
" ===
" vim-snazzy
" ===
color snazzy

" ===
" nerdtree
" ===
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
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeSize=30
let g:NERDTreeHidden=1
""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree

" ===
" nerdtree
" ===
" map tg :TagbarToggle<CR>
map tg :TagbarOpenAutoClose<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30


" ===
" coc
" ===
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-marketplace']
set hidden
set updatetime=300
set shortmess+=c

" 显示可用补全去窗口
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" tab 不补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" c-o 补全
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-o> coc#refresh()
endif
" CR 补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ===
" vimspector
" ===
nmap <LEADER>b <Plug>VimspectorToggleBreakpoint
nmap <LEADER>n <Plug>VimspectorStepOver
nmap <LEADER>i <Plug>VimspectorStepInto
nmap <LEADER>o <Plug>VimspectorStepOut
nmap <LEADER>c <Plug>VimspectorContinue
nmap <LEADER>s <Plug>VimspectorStop
nmap <LEADER>r <Plug>VimspectorRestart


