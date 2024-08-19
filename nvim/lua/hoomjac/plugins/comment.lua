-- import comment plugin safely
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

-- enable comment
comment.setup({
	toggler = {
		---Line-comment toggle keymap
		line = "<leader>cc",
		---Block-comment toggle keymap
		block = "<leader>bb",
	},
	---LHS of operator-pending mappings in NORMAL and VISUAL mode
	opleader = {
		---Line-comment keymap
		line = "<leader>c",
		---Block-comment keymap
		block = "<leader>b",
	},
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = false,
	},
})
