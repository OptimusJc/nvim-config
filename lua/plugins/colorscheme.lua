return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		opts = {
			flavour = "mocha",
			transparent_background = true,
			show_end_of_buffer = true,
			integrations = {
				treesitter = true,
				cmp = true,
				gitsigns = true,
				telescope = true,
				notify = true,
				mini = true,
				bufferline = true,
				native_lsp = { enabled = true },
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},

	{
		"lazyVim/lazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
