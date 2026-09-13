return {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = { library = { "lazy", "nvim-lspconfig", { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = { completions = { lsp = { enabled = true } } },
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = { enable_autocmd = false },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { indent = { char = "▏" } },
	},

	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		opts = {},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "lazygit" },
		},
	},
}
