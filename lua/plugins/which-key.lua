function config()
	require("which-key").setup({
		preset = "helix",
		icons = { mappings = false },
	})
	local wk = require("which-key")
	wk.add({
		{ "<leader>l", group = "lsp" },
		{ "<leader>f", group = "telescope" },
		{ "<leader>s", group = "search" },
		{ "<leader>g", group = "git" },
	})
end

return {
	{
		"folke/which-key.nvim",
		lazy = false,
		config = config,
	},
}
