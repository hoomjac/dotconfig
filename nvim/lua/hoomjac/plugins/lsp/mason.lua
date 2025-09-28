return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"pyright",
			},
			automatic_installation = true,
			automatic_enable = false,
		})
		end,
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"black",
					"flake8",
				},
				automatic_installation = true,
			})
		end,
		dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim"},
	},
}
