local map = require("core/mappings").map

local function config()
	require("fzf-lua").setup({ "telescope" })

	map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "find files" })
	map("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { desc = "live grep" })
	map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "find buffers" })
	map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "help page" })
	map("n", "<leader>fa", "<cmd>FzfLua marks<CR>", { desc = "find marks" })
	map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "find oldfiles" })
	map("n", "<leader>fz", "<cmd>FzfLua blines<CR>", { desc = "find in current buffer" })
	map("n", "<leader>fc", "<cmd>FzfLua git_commits<CR>", { desc = "git commits" })
	map("n", "<leader>fs", "<cmd>FzfLua git_status<CR>", { desc = "git status" })
	map("n", "<leader>fd", "<cmd>TodoFzfLua<CR>", { desc = "todo comments" })
end

return { "ibhagwan/fzf-lua", config = config }
