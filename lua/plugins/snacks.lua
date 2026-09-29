return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		buffer = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		picker = { enabled = true },
		indent = { enabled = true },
		notifier = { enabled = true },
		terminal = { enabled = true },
		lazygit = { enabled = true },
	},
	keys = {
		{
			"<leader>sf",
			function()
				Snacks.picker.smart()
			end,
			desc = "Find files",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep search",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Search diagnostics",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Search keymaps",
		},
		{
			"<leader>sn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Search notifications",
		},
		{
			"\\",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},
		{
			"<C-\\>",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Open terminal",
		},
		{
			"<leader>_",
			function()
				Snacks.lazygit()
			end,
			desc = "Open lazygit",
		},
		{
			"<leader><leader>d",
			function()
				Snacks.bufdelete()
			end,
			desc = "Close buffer",
		},
		{
			"<leader><leader>o",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Close other buffer",
		},
	},
}
