return {
	"phaazon/hop.nvim",
	branch = "v2",
	commit = "caaccee",
	config = function()
		local hop = require("hop")
		hop.setup({
			keys = "asdfghjkl;rtui",
		})

		local directions = require("hop.hint").HintDirection

		vim.keymap.set("", "<leader>l", function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })

		vim.keymap.set("", "<leader>h", function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })

		vim.keymap.set("", "<leader>j", function()
			hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false })
		end, { remap = true })

		vim.keymap.set("", "<leader>k", function()
			hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false })
		end, { remap = true })
	end,
}
