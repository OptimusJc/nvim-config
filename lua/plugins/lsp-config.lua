return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({

				ensure_installed = {
					"lua_ls", -- Lua language server
					-- "jsonls",
					-- "mdx_analyzer", -- MDX analyzer
					"pyright", -- Python language server
					"ts_ls", -- Typscript language server
					"tailwindcss", -- Tailwind CSS language server
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			print("Loading LSP configurations")
			local lspconfig = require("lspconfig")
			-- lspconfig.jsonls.setup({})
			lspconfig.lua_ls.setup({})
			-- lspconfig.mdx_analyzer.setup({})
			lspconfig.pyright.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.tailwindcss.setup({
				root_dir = function(fname)
					return lspconfig.util.root_pattern(
						"tailwind.config.ts",
						"package.json",
						".git"
					)(fname) or vim.fn.getcwd()
				end,
				filetypes = {
					"django-html",
					"htmldjango",
					"html",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				cmd = { "tailwindcss-language-server", "--stdio" },
			})

			vim.keymap.set(
				"n",
				"K",
				vim.lsp.buf.hover,
				{ desc = "Show hover information" }
			)
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				{ desc = "Go to definition" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>ca",
				vim.lsp.buf.code_action,
				{ desc = "Code Action" }
			)
		end,
	},
}
