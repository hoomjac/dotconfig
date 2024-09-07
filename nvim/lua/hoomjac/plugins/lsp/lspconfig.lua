return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"glepnir/lspsaga.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local util = require("lspconfig.util")

		local keymap = vim.keymap

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
			keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
			keymap.set("n", "gi", "<cmd>Lspsaga goto_definition<CR>", opts)
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
			keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
			keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

			if client.name == "ts_ls" then
				keymap.set("n", "<leader>rf", "<cmd>lua vim.lsp.buf.rename()<CR>")
				keymap.set(
					"n",
					"<leader>oi",
					"<cmd>lua vim.lsp.buf.execute_command({command = '_typescript.organizeImports', arguments = {vim.fn.expand('%:p')}})<CR>"
				)
				keymap.set(
					"n",
					"<leader>ru",
					"<cmd>lua vim.lsp.buf.execute_command({command = '_typescript.removeUnused', arguments = {vim.fn.expand('%:p')}})<CR>"
				)
			end
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local function get_typescript_server_path(root_dir)
			local global_ts = "/Users/hoomjac/.npm/lib/node_modules/typescript/lib"
			local found_ts = ""
			local function check_dir(path)
				found_ts = util.path.join(path, "node_modules", "typescript", "lib")
				if util.path.exists(found_ts) then
					return path
				end
			end
			if util.search_ancestors(root_dir, check_dir) then
				return found_ts
			else
				return global_ts
			end
		end

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["ts_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		lspconfig["volar"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			on_new_config = function(new_config, new_root_dir)
				new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
			end,
		})

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "rust" },
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "python" },
		})

		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
