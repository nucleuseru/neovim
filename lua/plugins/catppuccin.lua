local function config()
	require("catppuccin").setup({
		term_colors = true,
		dim_inactive = {
			enabled = true,
		},
	})

	vim.cmd.colorscheme("catppuccin-nvim")
end

return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = config },
}
