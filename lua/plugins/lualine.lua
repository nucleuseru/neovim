return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
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
				lualine_x = { "searchcount", "selectioncount" },
				lualine_y = { "progress" },
				lualine_z = {},
			},
			extensions = { "lazy", "neo-tree", "oil", "quickfix", "mason" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
