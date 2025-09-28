return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"glepnir/lspsaga.nvim",
	},
	config = function()
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
		local base_config = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		local function setup_server(name, opts)
			vim.lsp.config(name, vim.tbl_deep_extend("force", {}, base_config, opts or {}))
			vim.lsp.enable(name)
		end

		local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
		-- local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.diagnostic.signs.define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end

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

		setup_server("html")

		setup_server("ts_ls", {
			init_options = {
				preferences = {
					disableSuggestions = true,
				},
			},
		})

		setup_server("cssls")

		setup_server("tailwindcss")

		setup_server("emmet_ls", {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		setup_server("volar", {
			on_new_config = function(new_config, new_root_dir)
				if new_config.init_options and new_config.init_options.typescript then
					new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
				end
			end,
		})

		setup_server("rust_analyzer", {
			filetypes = { "rust" },
		})

		setup_server("pyright", {
			filetypes = { "python" },
		})

		setup_server("prismals")

		setup_server("lua_ls", {
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

		-- Add ESLint configuration here
		setup_server("eslint", {
			-- Only start eslint when a config file is present.
			root_dir = util.root_pattern(".eslintrc.js", ".eslintrc", ".eslintrc.json"),
		})
	end,
}
