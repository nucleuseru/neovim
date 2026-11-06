local diff = require("mini.diff")

diff.setup({
	view = {
		priority = 0,
		style = "sign",
		signs = { add = "▎", change = "▎", delete = "" },
	},
})

map("n", "<leader>gd", function()
	diff.toggle_overlay(0)
end, { desc = "Toggle diff overlay" })
