return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = { "Neotree" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local function open_grug_far(prefills)
				local grug_far = require("grug-far")

				if not grug_far.has_instance("explorer") then
					grug_far.open({ instanceName = "explorer" })
				else
					grug_far.get_instance("explorer"):open()
				end
				grug_far.get_instance("explorer"):update_input_values(prefills, false)
			end

			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					follow_current_file = {
						leave_dirs_open = false,
						enabled = true,
					},
					filtered_items = {
						visible = true,
					},
				},
				commands = {
					grug_far_replace = function(state)
						local node = state.tree:get_node()
						local prefills = {
							paths = node.type == "directory" and vim.fn.fnameescape(
								vim.fn.fnamemodify(node:get_id(), ":p")
							) or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h")),
						}
						open_grug_far(prefills)
					end,
					grug_far_replace_visual = function(state, selected_nodes, callback)
						local paths = {}
						for _, node in pairs(selected_nodes) do
							local path = node.type == "directory"
									and vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":p"))
								or vim.fn.fnameescape(vim.fn.fnamemodify(node:get_id(), ":h"))
							table.insert(paths, path)
						end
						local prefills = { paths = table.concat(paths, "\n") }
						open_grug_far(prefills)
					end,
				},
				window = {
					mappings = {
						z = "grug_far_replace",
					},
				},
			})
		end,
	},
	{
		"Crysthamus/nvim-file-operations",
		dependencies = {
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("nvim-file-operations").setup({
				will_rename_files = true,
				did_rename_files = true,
				will_create_files = true,
				did_create_files = true,
				will_delete_files = true,
				did_delete_files = true,
				timeout_ms = 10000,
				auto_save = false,
			})
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					bo = {
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
}
