call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'hoomjac/vim-easymotion'
call plug#end()

" vim-surround
" nmap <silent> , ysiw

" vim-easymotion
map <silent> <Leader>h <Plug>(easymotion-linebackward)
map <silent> <Leader>j <Plug>(easymotion-w)
map <silent> <Leader>k <Plug>(easymotion-b)
map <silent> <Leader>l <Plug>(easymotion-lineforward)
let g:EasyMotion_keys = 'asdhjkl;qwer'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_grouping = 2
let g:EasyMotion_smartcase = 1
