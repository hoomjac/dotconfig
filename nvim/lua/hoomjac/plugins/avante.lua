return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = "*", -- set this if you want to always pull the latest change
	opts = {
		-- add any opts here
		provider = "bedrock",
		bedrock = {
			endpoint = "https://d3tzw5mke0fhaa.cloudfront.net",
			model = "us.anthropic.claude-3-7-sonnet-20250219-v1:0",
			timeout = 30000, -- Timeout in milliseconds
			temperature = 0,
			max_tokens = 8000,
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			tag = "v6.3.0",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
