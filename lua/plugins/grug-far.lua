local map = require("core/mappings").map

local function config()
	local grug_far = require("grug-far")

	map({ "n", "x" }, "<leader>sl", function()
		grug_far.open({ prefills = { paths = vim.fn.expand("%"), search = vim.fn.expand("<cword>") } })
	end, { desc = "local" })

	map({ "n", "x" }, "<leader>sg", function()
		grug_far.open({ prefills = { search = vim.fn.expand("<cword>") } })
	end, { desc = "global" })
end

return { "MagicDuck/grug-far.nvim", config = config }
