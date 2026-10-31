local function config()
	require("catppuccin").setup({
		term_colors = true,
		auto_integrations = true,
		dim_inactive = {
			enabled = true,
		},
		integrations = {
			fzf = true,
			barbar = true,
			grug_far = true,
			mason = true,
			which_key = true,
		},
	})

	vim.cmd.colorscheme("catppuccin-nvim")
end

return { "catppuccin/nvim", name = "catppuccin", priority = 1000, config = config }
