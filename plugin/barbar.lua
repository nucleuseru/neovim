vim.pack.add({ "https://github.com/romgrk/barbar.nvim" })

local barbar = require("barbar")
_G.Barbar = barbar

later(function()
	barbar.setup({
		icons = { modified = { button = "" } },
		sidebar_filetypes = { NvimTree = true },
	})
end)

map("n", "<C-c>", "<Cmd>BufferClose<CR>", { desc = "close" })
map("n", "<A-c>", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "close" })
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { desc = "go to buffer 1" })
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { desc = "go to buffer 2" })
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { desc = "go to buffer 3" })
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { desc = "go to buffer 4" })
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { desc = "go to buffer 5" })
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { desc = "go to buffer 6" })
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { desc = "go to buffer 7" })
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { desc = "go to buffer 8" })
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { desc = "go to buffer 9" })
map("n", "<A-0>", "<Cmd>BufferLast<CR>", { desc = "go to last buffer" })
