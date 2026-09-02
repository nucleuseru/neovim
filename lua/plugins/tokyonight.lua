local options = {
	style = "night",
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
	dim_inactive = true,
}

return {
	{
		"folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup(options)
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
