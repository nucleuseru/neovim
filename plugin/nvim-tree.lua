vim.pack.add({
	"https://github.com/nvim-tree/nvim-tree.lua",
	"https://github.com/antosha417/nvim-lsp-file-operations",
})

local lsp_file_operations = require("lsp-file-operations")
_G.LspFileOperations = lsp_file_operations
lsp_file_operations.setup({ auto_save = true })

local nvim_tree = require("nvim-tree")
_G.NvimTree = nvim_tree

local nvim_tree_api = require("nvim-tree.api")
_G.NvimTreeApi = nvim_tree_api

nvim_tree.setup({
	filters = { dotfiles = false },
	disable_netrw = true,
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
		update_root = { enable = false },
	},
	view = {
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = "name",
		indent_markers = { enable = true },
		icons = {
			glyphs = {
				default = "󰈚",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
				},
				git = { unmerged = "" },
			},
		},
	},
})


map("n", "<C-n>", function()
	nvim_tree_api.tree.toggle()
end, { desc = "Explorer" })

map("n", "<leader>ge", function()
	nvim_tree_api.git.reload()
end, { desc = "Reload explorer" })
