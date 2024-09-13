-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		"nvim-lua/plenary.nvim", -- lua functions that many plugins use
		"bluz71/vim-nightfly-guicolors", -- preferred colorscheme
		"christoomey/vim-tmux-navigator", -- tmux & split window navigation
		"szw/vim-maximizer", -- maximizes and restores current window
		"tpope/vim-unimpaired", -- use `[` `]` for a lot of operation(exp: ] space for adding a line below)
		-- essential plugins
		"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
		"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
		"voldikss/vim-floaterm", -- float a window above current neovim window(for lazy git floated window)
		"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
		-- git integration
		{ "lewis6991/gitsigns.nvim", config = true }, -- show line modifications on left hand side
		-- SmoothCursor
		{
			"gen740/SmoothCursor.nvim",
			config = true,
		},
		{ import = "hoomjac.plugins" },
		{ import = "hoomjac.plugins.lsp" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})
