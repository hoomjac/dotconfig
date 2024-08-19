let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><CR> :so %<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>pd o<esc>P
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
" 复制整个文件的内容到系统剪切板
nnoremap <leader>Y gg"+yG

" 移动行
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" 用 < 和 > 调整缩进
nnoremap < <<
nnoremap > >>

" 用shift + hjkl 将光标跳转到 最上，最下，行首，行尾巴
noremap H ^
noremap L $

" 用yank的内容，替换光标所在处的word，并保留原先yank的内容，可继续进行替换
nnoremap <leader>p viw"_dP
" 用yank的内容，替换光标所在处的line，并保留原先yank的内容，可继续进行替换
nnoremap <leader>P V"0P
" 在当前行下方插入一行，并进退回normal模式
nnoremap <leader>o o<ESC>
" 在当前行上方插入一行，并进退回normal模式
nnoremap <leader>O O<ESC>
