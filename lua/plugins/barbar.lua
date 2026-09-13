local map = require("core/mappings").map

local function config()
	require("barbar").setup({
		icons = { modified = { button = "" } },
		sidebar_filetypes = { NvimTree = true },
	})

	-- Move to previous/next
	map("n", "<leader>bp", "<Cmd>BufferPrevious<CR>", { desc = "previous" })
	map("n", "<leader>bn", "<Cmd>BufferNext<CR>", { desc = "next" })

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

	-- Close buffer
	map("n", "<leader>bc", "<Cmd>BufferClose<CR>", { desc = "close" })
	map("n", "<leader>c", "<Cmd>BufferClose<CR>", { desc = "close" })
	map("n", "<C-c>", "<Cmd>BufferClose<CR>", { desc = "close" })

	-- Wipeout buffer
	map("n", "<leader>bw", "<Cmd>BufferWipeout<CR>", { desc = "wipeout" })
end

return {
	{
		"romgrk/barbar.nvim",
		version = "^1.0.0",
		init = function()
			vim.g.barbar_auto_setup = false
			vim.opt.sessionoptions:append("globals")

			vim.api.nvim_create_user_command("Mksession", function(attr)
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
				vim.api.nvim_command("mksession " .. (attr.bang and "!" or "") .. attr.args)
			end, { bang = true, complete = "file", nargs = "?" })
		end,
		config = config,
	},
}
