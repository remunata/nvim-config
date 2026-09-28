local icon = vim.fn.nr2char

local function lsp_clients()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end
	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end
	return icon(0xf013) .. " " .. table.concat(names, ", ")
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			component_seperators = { left = icon(0xe0bc), right = icon(0xe0ba) },
			section_seperators = { left = icon(0xe0bb), right = icon(0xe0bb) },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "filetype", icon_only = true, seperator = "", padding = { left = 1, right = 1 } },
				{ "filename", padding = { left = 1, right = 1 } },
			},
			lualine_c = { { "navic", color_correction = "dynamic" } },
			lualine_x = { lsp_clients },
			lualine_y = { "branch", "progress" },
			lualine_z = { "location" },
		},
		tabline = {
			lualine_a = { "buffers" },
			lualine_z = { "tabs" },
		},
	},
}
