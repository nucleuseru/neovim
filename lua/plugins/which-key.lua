local function config()
	local wk = require("which-key")

	wk.setup({
		preset = "helix",
		icons = { mappings = false },
	})

	wk.add({
		{ "<leader>b", group = "buffer" },
		{ "<leader>f", group = "telescope" },
		{ "<leader>g", group = "git" },
		{ "<leader>l", group = "lsp" },
		{ "<leader>s", group = "search" },
	})
end

return {
	{ "folke/which-key.nvim", config = config },
}
