vim.pack.add({ "https://github.com/monkoose/neocodeium" })

local neocodeium = require("neocodeium")
_G.Neocodeium = neocodeium

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		neocodeium.clear()
	end,
})

later(function()
	neocodeium.setup({
		silent = true,
		filter = function()
			if BlinkCmp.is_visible() then
				return false
			end
			return true
		end,
	})
end)

map("i", "<A-f>", function()
	neocodeium.accept()
end, { desc = "NeoCodeium accept" })

map("i", "<A-w>", function()
	neocodeium.accept_word()
end, { desc = "NeoCodeium accept word" })

map("i", "<A-a>", function()
	neocodeium.accept_line()
end, { desc = "NeoCodeium accept line" })

map("i", "<A-e>", function()
	neocodeium.cycle_or_complete()
end, { desc = "NeoCodeium cycle/complete" })

map("i", "<A-r>", function()
	neocodeium.cycle_or_complete(-1)
end, { desc = "NeoCodeium cycle previous" })

map("i", "<A-c>", function()
	neocodeium.clear()
end, { desc = "NeoCodeium clear" })

map("n", "<leader>tc", "<cmd>NeoCodeium toggle<cr>", { desc = "Toggle NeoCodeium" })
