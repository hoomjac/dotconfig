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
			})
		end,
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"jay-babu/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint_d",
					"black",
					"flake8",
				},
				automatic_installation = true,
			})
		end,
		dependencies = { "williamboman/mason.nvim", "nvim-lua/plenary.nvim" },
	},
}
