local options = {
	auto_hide = 1,
	icons = { modified = { button = "" } },
	sidebar_filetypes = { ["neo-tree"] = { event = "BufWipeout" } },
}

return {
	{
		"romgrk/barbar.nvim",
		opts = options,
		version = "^1.0.0",
		event = { "BufNew" },
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
			vim.opt.sessionoptions:append("globals")

			vim.api.nvim_create_user_command("Mksession", function(attr)
				vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
				vim.api.nvim_command("mksession " .. (attr.bang and "!" or "") .. attr.args)
			end, { bang = true, complete = "file", nargs = "?" })
		end,
	},
}
