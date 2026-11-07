vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

local gitsigns = require("gitsigns")
_G.Gitsigns = gitsigns

gitsigns.setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function git_map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			map(mode, l, r, opts)
		end

		-- Navigation
		git_map("n", "]h", function()
			if vim.wo.diff then
				return "]h"
			end
			vim.schedule(function()
				gs.nav_hunk("next")
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Next hunk" })

		git_map("n", "[h", function()
			if vim.wo.diff then
				return "[h"
			end
			vim.schedule(function()
				gs.nav_hunk("prev")
			end)
			return "<Ignore>"
		end, { expr = true, desc = "Prev hunk" })

		-- Actions
		git_map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
		git_map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Seset hunk" })
		git_map("n", "<leader>gS", gs.stage_buffer, { desc = "Stage buffer" })
		git_map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
		git_map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset buffer" })
		git_map("n", "<leader>gp", gs.preview_hunk_inline, { desc = "Preview hunk" })
		git_map("n", "<leader>gb", function()
			gs.blame_line({ full = true })
		end, { desc = "Blame line" })
	end,
})
