set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'itchyny/lightline.vim'
Plugin 'rose-pine/vim'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-surround'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dense-analysis/ale'
Plugin 'junegunn/vim-peekaboo'
Plugin 'maximbaz/lightline-ale'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'mengelbrecht/lightline-bufferline'
Plugin 'NLKNguyen/copy-cut-paste.vim'
Plugin 'AutoScrollMode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" Lightline and related stuff
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'default'
      \ }
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers'
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \     'buffers': 'tabsel'
      \ }
let g:lightline.active = { 'left': [[ 'mode', 'paste' ], [ 'readonly', 'buffers', 'modified' ]], 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }
let g:lightline#bufferline#show_number  = 1
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" Theme stuff
set background=dark
colorscheme rosepine_moon
let g:disable_bg = 1
let g:disable_float_bg = 1

" NERDTree stuff
map <C-o> :NERDTreeToggle<CR>

" Generic stuff
set number
syntax on
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline

" Function name display
fun! ShowFuncName()
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bWn'))
  echohl None
endfun
map f :call ShowFuncName() <CR>

" Buffer cycle mappings (overrides gn and gN)
map gn :bnext<CR>
map gN :bprevious<CR>
map gd :bdelete<CR>
