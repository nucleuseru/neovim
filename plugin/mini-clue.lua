local miniclue = require("mini.clue")

miniclue.setup({
	triggers = {
		{ mode = { "n", "x" }, keys = "<Leader>" },
		{ mode = "n", keys = vim.g.maplocalleader },
		{ mode = "n", keys = "[" },
		{ mode = "n", keys = "]" },
		{ mode = "i", keys = "<C-x>" },
		{ mode = { "n", "x" }, keys = "g" },
		{ mode = { "n", "x" }, keys = "'" },
		{ mode = { "n", "x" }, keys = "`" },
		{ mode = { "n", "x" }, keys = '"' },
		{ mode = { "i", "c" }, keys = "<C-r>" },
		{ mode = "n", keys = "<C-w>" },
		{ mode = { "n", "x" }, keys = "z" },
	},

	clues = {
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
		miniclue.gen_clues.square_brackets(),

		{ mode = "n", keys = "<Leader>f", desc = "+Find" },
		{ mode = "n", keys = "<Leader>g", desc = "+Git" },
		{ mode = "n", keys = "<Leader>l", desc = "+LSP" },
		{ mode = "x", keys = "<Leader>l", desc = "+LSP" },
		{ mode = "n", keys = "<Leader>s", desc = "+Search / Replace" },
		{ mode = "x", keys = "<Leader>s", desc = "+Search / Replace" },
		{ mode = "n", keys = "<Leader>t", desc = "+Toggle" },
	},
	window = {
		delay = 300,
		config = { width = "auto", border = "single" },
	},
})
