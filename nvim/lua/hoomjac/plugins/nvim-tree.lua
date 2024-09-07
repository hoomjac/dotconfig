return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")
		local nvimtreeApi = require("nvim-tree.api")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

		-- open tree panel when project booted
		local function open_nvim_tree(data)
			local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
			local directory = vim.fn.isdirectory(data.file) == 1

			if not no_name and not directory then
				return
			end

			if directory then
				vim.cmd.cd(data.file)
			end

			nvimtreeApi.tree.open()
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

		nvimtree.setup({
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		})
	end,
}
