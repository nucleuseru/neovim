vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

local lualine = require("lualine")
_G.Lualine = lualine

later(function()
	lualine.setup({
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
		extensions = { "nvim-tree", "quickfix", "mason", "man" },
	})
end)
