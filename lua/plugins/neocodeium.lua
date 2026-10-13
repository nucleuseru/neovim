local function config()
	local neocodeium = require("neocodeium")
	local blink = require("blink.cmp")

	vim.api.nvim_create_autocmd("User", {
		pattern = "BlinkCmpMenuOpen",
		callback = function()
			neocodeium.clear()
		end,
	})

	neocodeium.setup({
		filter = function()
			return not blink.is_visible()
		end,
	})

	vim.keymap.set("i", "<A-f>", function()
		neocodeium.accept()
	end)
	vim.keymap.set("i", "<A-w>", function()
		neocodeium.accept_word()
	end)
	vim.keymap.set("i", "<A-a>", function()
		neocodeium.accept_line()
	end)
	vim.keymap.set("i", "<A-e>", function()
		neocodeium.cycle_or_complete()
	end)
	vim.keymap.set("i", "<A-r>", function()
		neocodeium.cycle_or_complete(-1)
	end)
	vim.keymap.set("i", "<A-c>", function()
		neocodeium.clear()
	end)
end

return { "monkoose/neocodeium", event = "VeryLazy", config = config }
