local map = require("core/mappings").map

local function config()
	local telescope = require("telescope")
	telescope.setup({
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})
	telescope.load_extension("fzf")

	map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "find files" })
	map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "live grep" })
	map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "find buffers" })
	map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "help page" })
	map("n", "<leader>fa", "<cmd>Telescope marks<CR>", { desc = "find marks" })
	map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "find oldfiles" })
	map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "find in current buffer" })
	map("n", "<leader>fc", "<cmd>Telescope git_commits<CR>", { desc = "git commits" })
	map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", { desc = "git status" })
	map("n", "<leader>fd", "<cmd>TodoTelescope<CR>", { desc = "todo telescope" })
end

return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = config,
	},
}
