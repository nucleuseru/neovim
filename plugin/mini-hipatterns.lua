local hipatterns = require("mini.hipatterns")

later(function()
	local hi_words = MiniExtra.gen_highlighter.words

	hipatterns.setup({
		highlighters = {
			hack = hi_words({ "HACK" }, "MiniHipatternsHack"),
			todo = hi_words({ "TODO" }, "MiniHipatternsTodo"),
			note = hi_words({ "NOTE" }, "MiniHipatternsNote"),
			fixme = hi_words({ "FIXME" }, "MiniHipatternsFixme"),
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
end)
