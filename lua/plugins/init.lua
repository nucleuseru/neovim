return {
	"nvim-lua/plenary.nvim",
	"nvim-tree/nvim-web-devicons",

	{ "OXY2DEV/foldtext.nvim", lazy = false },
	{ "chrisgrieser/nvim-origami", event = "VeryLazy", opts = {} },

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"lazy",
				"nvim-lspconfig",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		cmd = { "RenderMarkdown" },
		opts = {
			completions = { lsp = { enabled = true } },
		},
	},

	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufEnter", "BufWinEnter", "BufNew" },
	},

	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = { git = true },
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { indent = { char = "▏" } },
		event = { "BufEnter", "BufWinEnter", "BufNew" },
	},

	{
		"windwp/nvim-ts-autotag",
		event = { "InsertEnter" },
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		opts = {},
	},

	{
		"MagicDuck/grug-far.nvim",
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		event = { "BufEnter", "BufWinEnter", "BufNew" },
		opts = {},
	},

	{
		"numToStr/Comment.nvim",
		keys = { "gcc", "gbc", "gc", "gb" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},

	{
		"Bekaboo/dropbar.nvim",
		event = { "BufEnter", "BufWinEnter", "BufNew" },
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
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
