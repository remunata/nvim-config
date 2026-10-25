return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({})

		ts.install({
			"astro",
			"bash",
			"css",
			"dockerfile",
			"dot",
			"fish",
			"go",
			"html",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"php",
			"regex",
			"scss",
			"svelte",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"yaml",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
			callback = function(ev)
				local ok = pcall(vim.treesitter.start, ev.buf)
				if ok then
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
