require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = "single",
	},
	mappings = {
		basic = true,
		option_toggle_prefix = [[\]],
		windows = true,
		move_with_alt = true,
	},
	autocommands = {
		basic = true,
		relnum_in_visual_mode = true,
	},
})

require("mini.bracketed").setup()
require("mini.cursorword").setup()
require("mini.input").setup()
require("mini.notify").setup()
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.extra").setup()
