local function config()
	require("mini.pairs").setup({})
	require("mini.comment").setup({
		options = {
			custom_commentstring = function()
				return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
			end,
		},
	})
	require("mini.ai").setup({})
	require("mini.surround").setup({})

	vim.opt.sessionoptions:append("globals")
	require("mini.sessions").setup({
		hooks = {
			pre = {
				write = function()
					vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
				end,
			},
		},
	})
end

return { "echasnovski/mini.nvim", config = config }
