local status, refactoring = pcall(require, "refactoring")
if not status then
	return
end

refactoring.setup({
	-- overriding printf statement for JS
	print_var_statements = {
		-- add a custom print var statement for JS
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
