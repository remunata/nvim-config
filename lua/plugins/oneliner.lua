return {
	{ "tpope/vim-sleuth" },

	{ "nvim-tree/nvim-web-devicons", opts = {} },

	{ "folke/which-key.nvim", opts = {} },

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				bottom_search = true,
				command_palette = true,
			},
		},
	},

	{ "numToStr/Comment.nvim", opts = {} },
}
