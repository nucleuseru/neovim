return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				component_separators = "",
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "searchcount", "selectioncount", "location" },
				lualine_y = { "progress" },
				lualine_z = { { "datetime", style = "%H:%M" } },
			},
			extensions = { "lazy", "nvim-tree", "quickfix", "mason", "man" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
