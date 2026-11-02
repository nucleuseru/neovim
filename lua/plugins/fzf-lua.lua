local map = require("core/mappings").map

local function config()
	local fzf = require("fzf-lua")

	fzf.setup({
		{ "telescope", "hide" },
		ui_select = {},
		fzf_colors = true,
		actions = {
			files = {
				["ctrl-q"] = fzf.actions.file_sel_to_qf,
				["alt-q"] = fzf.actions.file_sel_to_qf,
			},
		},
	})

	map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "find files" })
	map("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { desc = "live grep" })
	map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "find buffers" })
	map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "help page" })
	map("n", "<leader>fa", "<cmd>FzfLua marks<CR>", { desc = "find marks" })
	map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "find oldfiles" })
	map("n", "<leader>fz", "<cmd>FzfLua blines<CR>", { desc = "find in current buffer" })
	map("n", "<leader>fc", "<cmd>FzfLua git_commits<CR>", { desc = "git commits" })
	map("n", "<leader>fs", "<cmd>FzfLua git_status<CR>", { desc = "git status" })
	map("n", "<leader>fr", "<cmd>FzfLua resume<CR>", { desc = "resume last search" })
	map("n", "<leader>fq", "<cmd>FzfLua quickfix<CR>", { desc = "quickfix list" })
end

return { "ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = config }
