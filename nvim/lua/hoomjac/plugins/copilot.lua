return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = { enabled = false },
		panel = { enabled = false },
		copilot_node_command = vim.fn.expand("$HOME") .. "/.volta/tools/image/node/22.3.0/bin/node", -- Node.js version must be > 18.x
	},
	config = true,
}
