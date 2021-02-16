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
nnoremap W :w<CR>
nnoremap <M-up> :m-2<CR>
nnoremap <M-down> :m+1<CR>
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
" set autochdir


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
" complete
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
call plug#end()

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
"let g:NERDTreeDirArrowExpandable = '+'
"let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeSize=30
let g:NERDTreeHidden=1
""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
autocmd vimenter * NERDTree

" map tg :TagbarToggle<CR>
map tg :TagbarOpenAutoClose<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30


" coc
let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-marketplace']
set hidden
set updatetime=300
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-o> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" vimspector
nmap <LEADER>b <Plug>VimspectorToggleBreakpoint
nmap <LEADER>n <Plug>VimspectorStepOver
nmap <LEADER>i <Plug>VimspectorStepInto
nmap <LEADER>o <Plug>VimspectorStepOut
nmap <LEADER>c <Plug>VimspectorContinue
nmap <LEADER>s <Plug>VimspectorStop
nmap <LEADER>r <Plug>VimspectorRestart
