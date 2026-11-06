vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" })

local ai = require("mini.ai")

later(function()
	local gen_ai_spec = MiniExtra.gen_ai_spec

	ai.setup({
		custom_textobjects = {
			B = gen_ai_spec.buffer(),
			D = gen_ai_spec.diagnostic(),
			I = gen_ai_spec.indent(),
			L = gen_ai_spec.line(),
			N = gen_ai_spec.number(),
			F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
			C = ai.gen_spec.treesitter({ a = "@classunction.outer", i = "@class.inner" }),
			o = ai.gen_spec.treesitter({
				a = { "@conditional.outer", "@loop.outer" },
				i = { "@conditional.inner", "@loop.inner" },
			}),
		},
		search_method = "cover",
	})
end)
