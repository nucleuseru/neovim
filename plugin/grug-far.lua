vim.pack.add({
	"https://github.com/MagicDuck/grug-far.nvim",
})

local grug_far = require("grug-far")
_G.GrugFar = grug_far

grug_far.setup({
	debounceMs = 500,
})

-- Search global (workspace)
map("n", "<leader>sg", function()
	grug_far.open({ prefills = { search = vim.fn.expand("<cword>") } })
end, { desc = "Search workspace (word)" })

map("x", "<leader>sg", function()
	grug_far.with_visual_selection({})
end, { desc = "Search workspace (selection)" })

-- Search local (current file)
map("n", "<leader>sl", function()
	grug_far.open({ prefills = { paths = vim.fn.expand("%"), search = vim.fn.expand("<cword>") } })
end, { desc = "Search current file (word)" })

map("x", "<leader>sl", function()
	grug_far.with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
end, { desc = "Search current file (selection)" })

-- Open GrugFar dialog
map("n", "<leader>so", function()
	grug_far.open()
end, { desc = "Open GrugFar search" })
