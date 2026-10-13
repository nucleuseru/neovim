return {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	{ "MeanderingProgrammer/render-markdown.nvim", opts = { completions = { lsp = { enabled = true } } } },

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "▏" } } },

	{ "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	{ "MagicDuck/grug-far.nvim", opts = {} },
}
