return {
	"danymat/neogen",
	config = true,
	version = "*",
	keys = {
		{
			"<leader>ng",
			function()
				require("neogen").generate()
			end,
			desc = "Generate neogen",
		},
	},
}
