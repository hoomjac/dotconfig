return {
	"ThePrimeagen/refactoring.nvim",
	config = function()
		local status, refactoring = pcall(require, "refactoring")
		if not status then
			return
		end

		refactoring.setup({
			print_var_statements = {
				javascript = {
					'console.log("%s", %s)',
				},
				typescript = {
					'console.log("%s", %s)',
				},
				javascriptreact = {
					'console.log("%s", %s)',
				},
				typescriptreact = {
					'console.log("%s", %s)',
				},
			},
		})
	end,
}
