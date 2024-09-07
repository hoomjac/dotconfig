-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Visualize all file
keymap.set("n", "<leader>va", "ggVG")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- 用shift + hjkl 将光标跳转到 最上，最下，行首，行尾巴
keymap.set("", "H", "^")
keymap.set("", "L", "$")

-- 用 < 和 > 调整缩进
keymap.set("n", "<", "<<")
keymap.set("n", ">", ">>")

-- 移动行
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- 用yank的内容，替换光标所在处的word，并保留原先yank的内容，可继续进行替换
keymap.set("n", "<leader>p", 'viw"_dP')
-- 用yank的内容，替换本文件内所有光标所在处的word
keymap.set("n", "<leader>P", ":%s/<C-R><C-W>/<C-R>0/g<CR><C-o>")

-- 清除quickfix list
keymap.set("n", "<leader>cf", function()
	vim.fn.setqflist({})
	print("Quickfix list cleared")
end, { desc = "Clear quickfix list" })
