return {
	"echasnovski/mini.animate",
	version = "*",
	config = function()
		require("mini.animate").setup({
			resize = { enable = false },
			open = { enable = false },
			close = { enable = false },
			cursor = {
				enable = true,
				timing = function(_, n)
					return 150 / n
				end, -- Slightly slower for smoother animation
			},
			scroll = {
				enable = true,
				timing = function(_, n)
					return 150 / n
				end, -- Faster scroll animation
			},
		})
	end,
}
