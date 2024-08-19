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

----------------------
-- Plugin Keybinds
----------------------

-- lazygit popup window
keymap.set("n", "<leader>gt", ":FloatermNew lazygit<CR>")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>fe", ":NvimTreeFindFile<CR>") -- find file in explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>")
keymap.set("n", "<leader>fO", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
keymap.set("n", "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>")

-- telescope git commands (not on youtube nvim video)
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- refactoring code keymap

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

-- remap to open the Telescope refactoring menu in visual mode
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

-- Remap in normal mode and passing { normal = true } will automatically find the variable under the cursor and print it
keymap.set("n", "<leader>rv", ":lua require('refactoring').debug.print_var({ normal = true })<CR>", { noremap = true })
-- Cleanup function: this remap should be made in normal mode
keymap.set("n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", { noremap = true })

-- Rayso keymapping
keymap.set("v", "<leader>ss", ":'<,'>Rayso<CR>")
