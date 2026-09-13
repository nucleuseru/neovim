local function config()
	require("gitsigns").setup({
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]h", function()
				if vim.wo.diff then
					return "]h"
				end
				vim.schedule(function()
					gs.nav_hunk("next")
				end)
				return "<Ignore>"
			end, { expr = true, desc = "git next hunk" })

			map("n", "[h", function()
				if vim.wo.diff then
					return "[h"
				end
				vim.schedule(function()
					gs.nav_hunk("prev")
				end)
				return "<Ignore>"
			end, { expr = true, desc = "git prev hunk" })

			-- Actions
			map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
			map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
			map("n", "<leader>gS", gs.stage_buffer, { desc = "stage buffer" })
			map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
			map("n", "<leader>gR", gs.reset_buffer, { desc = "reset buffer" })
			map("n", "<leader>gp", gs.preview_hunk_inline, { desc = "preview hunk" })
			map("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { desc = "blame line" })
		end,
	})
end

return {
	{ "lewis6991/gitsigns.nvim", config = config },

	{
		"NeogitOrg/neogit",
		dependencies = {
			"sindrets/diffview.nvim",
			"m00qek/baleia.nvim",
		},
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},
}
