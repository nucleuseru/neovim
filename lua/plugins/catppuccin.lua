return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
        term_colors = true,
        dim_inactive = {
          enabled = true,
        },
			})
			vim.cmd.colorscheme("catppuccin-nvim")
		end,
	},
}
