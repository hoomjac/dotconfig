let mapleader = " "
" vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" 用yank的内容，替换光标所在处的word，并保留原先yank的内容，可继续进行替换
nnoremap <leader>p viw"_dP
" 用yank的内容，替换光标所在处的line，并保留原先yank的内容，可继续进行替换
nnoremap <leader>P V"_dP

" 把删除的内容注册到黑洞寄存器，这样粘贴的内容依然是刚刚yank的内容
vnoremap <leader>p "_dP

" 在当前行下方插入一行，并进退回normal模式
nnoremap <leader>o o<ESC>
" 在当前行上方插入一行，并进退回normal模式
nnoremap <leader>O O<ESC>

" 调用VSCode自带的comment插件
nmap <leader>c <Plug>VSCodeCommentary
xmap <leader>c <Plug>VSCodeCommentary
omap <leader>c <Plug>VSCodeCommentary
nmap <leader>cc <Plug>VSCodeCommentaryLine


" 用 < 和 > 调整缩进
nnoremap < <<
nnoremap > >>

" 用shift + hjkl 讲光标跳转到 最上，最下，行首，行尾巴
noremap H ^
noremap L $

" 移动行 在VSCode中会出样式错误,取消此快捷键
" xnoremap K :m '<-2<CR>gv=gv
" xnoremap J :m '>+1<CR>gv=gv
