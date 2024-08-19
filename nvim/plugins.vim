call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ayu-theme/ayu-vim'
call plug#end()


set termguicolors
let ayucolor="dark"
colorscheme ayu


" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultNesting = 1  
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
  \   'clojure': { 'left': ';;' },
  \ }

