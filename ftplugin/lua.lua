vim.pack.add({
	"https://github.com/folke/lazydev.nvim",
})

local lazydev = require("lazydev")
_G.Lazydev = lazydev

lazydev.setup({
	library = { "mini.nvim", "nvim-lspconfig" },
})
