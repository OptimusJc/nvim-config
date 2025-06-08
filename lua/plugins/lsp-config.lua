return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls", -- Lua language server
				"mdx_analyzer", -- MDX analyzer
				"pyright", -- Python language server
				"tsserver", -- Typscript language server
				"tailwindcss", -- Tailwind CSS language server
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			print("Loading LSP configurations")
			local lspconfig = require("lspconfig")
			local util = require("lspconfig.util")

			lspconfig.lua_ls.setup({})
			lspconfig.mdx_analyzer.setup({})
			lspconfig.pyright.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.tailwindcss.setup({
				root_dir = function(fname)
					return util.root_pattern(
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
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = { "prettier", "isort", "autopep8" },
		},
	},
}
