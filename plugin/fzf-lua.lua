vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")
_G.Fzf = fzf

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

map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help page" })
map("n", "<leader>fa", "<cmd>FzfLua marks<CR>", { desc = "Find marks" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "Find oldfiles" })
map("n", "<leader>fz", "<cmd>FzfLua blines<CR>", { desc = "Find in current buffer" })
map("n", "<leader>fc", "<cmd>FzfLua git_commits<CR>", { desc = "Git commits" })
map("n", "<leader>fs", "<cmd>FzfLua git_status<CR>", { desc = "Git status" })
map("n", "<leader>fr", "<cmd>FzfLua resume<CR>", { desc = "Resume last search" })
map("n", "<leader>fq", "<cmd>FzfLua quickfix<CR>", { desc = "Quickfix list" })
