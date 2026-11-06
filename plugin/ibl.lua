vim.pack.add({
	"https://github.com/lukas-reineke/indent-blankline.nvim",
})

local ibl = require("ibl")
_G.Ibl = ibl

ibl.setup({
	indent = { char = "▏", priority = 0 },
})
