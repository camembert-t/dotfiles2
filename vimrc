"*** setting ***"
"* pass *
" let g:python3_host_prog = substitute(system('which python3'),"\n","","")
" let g:python3_host_prog = expand('~/.pyenv/versions/3.8.0/envs/develop/bin/python')

"* setting *
" エンコード
set encoding=utf-8
" バックアップを作成しない
set nobackup
" スワップファイルを作成しない
set noswapfile
" 変更を自動で読み込む
set autoread
" バッファ切り替え時の保存の警告を無効化
set hidden
" マウス有効化
set mouse=a
" クリップボード設定
set clipboard&
set clipboard+=unnamedplus
" ファイルタイプの検出
filetype on
filetype plugin indent on
" 括弧の補完
set showmatch
" ファイル名をタブ補完
set wildmode=list:full
" カーソルが行末の1つ先まで移動可能
set virtualedit=onemore
" カーソルが行頭、行末で行をまたいで移動可能
set whichwrap=b,s,h,l,<,>,[,],~
" バックスペースで行移動を可能にする
set backspace=indent,eol,start
" 10行余裕をもってスクロール
set scrolloff=10

"* indent *
" オートインデント
set smartindent
" タブをスペースに置換
set expandtab
" インデント幅
set tabstop=2
set shiftwidth=2
" タブを可視化
set list listchars=tab:\▸\-

" カーソル位置を記憶
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


"* search *
" 大文字のみ区別する
set ignorecase
set smartcase
" 全てのマッチをインクリメンタルハイライト
set incsearch
" 検索時に最後までいったら最初に戻る
set wrapscan
" 検索した文字をハイライト
set hlsearch

"* visual *
" シンタックスハイライト
syntax on
" 行番号
set number
" カーソルライン
set cursorline
" ステータスラインを常に表示
set laststatus=2
" コマンドをステータスに表示
set showcmd


" *** keybind ***
" 行中移動
noremap j gj
noremap k gk
" : と ; をスワップ
noremap ; :
noremap : ;
" ウィンドウの移動
noremap sh <C-w>h
noremap sj <C-w>j
noremap sk <C-w>k
noremap sl <C-w>l
noremap sw <C-w>w
" ハイライトを消す
noremap <Esc><Esc> :nohlsearch<CR><Esc>
" jj でエスケープ
inoremap jj <ESC>
" ターミナルモード中のノーマルモードへのマップ
tnoremap jj <C-\><C-n>
tnoremap <ESC> <C-\><C-n>
" マップリーダーキー
let mapleader = ','
let maplocalleader = "\<Space>"



" *** vim-plug ***
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
  
  " tool
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  " Plug 'w0rp/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/indentLine'
  Plug 'scrooloose/nerdcommenter'
  Plug 'cohama/lexima.vim'
  Plug 'mbbill/undotree'
  " Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'sheerun/vim-polyglot'

  " git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " markdown
  Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }
  Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }

  " tex
  " Plug 'lervag/vimtex'
    
  " theme
  Plug 'jonathanfilip/vim-lucius'

call plug#end()



" *** plugin ***
" nerdtree
let g:NERDTreeWinSize = 20
noremap <silent><C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tagbar
set tags=.tags;,tag
let g:tagbar_width = 20
noremap <silent><C-f> :TagbarToggle<CR>

" ale
"let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
noremap <silent><C-k> :bprevious<CR>
noremap <silent><C-l> :bnext<CR>
noremap <silent><C-j> :bdelete<CR>

" indentLine
let g:indentLine_color_term = 239
let g:indentLine_setConceal = 0

" nerdcommenter
let g:NERDSpaceDelims = 1

" undotree
noremap <silent><C-u> :UndotreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><C-j> pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>"
inoremap <silent><expr><C-k> pumvisible() ? "\<C-p>" : "\<C-x>\<C-o>"

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipEditSplit="vertical"

" polyglot
let g:vim_markdown_conceal = 0

" vim-lucius
set background=dark
colorscheme lucius

" gitgutter
nmap ]d <Plug>(GitGutterNextHunk)
nmap [d <Plug>(GitGutterPrevHunk)
