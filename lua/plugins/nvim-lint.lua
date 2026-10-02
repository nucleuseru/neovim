local function config()
	require("lint").linters_by_ft = {
		javascript = { "oxlint", "cspell" },
		javascriptreact = { "oxlint", "cspell" },
		typescript = { "oxlint", "cspell" },
		typescriptreact = { "oxlint", "cspell" },
	}

	vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end

return {
	{ "mason-org/mason.nvim", opts = {} },
	{ "mfussenegger/nvim-lint", config = config },
	{ "rshkarin/mason-nvim-lint", opts = {} },
}
