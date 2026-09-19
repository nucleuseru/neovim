local function config()
	require("lint").linters_by_ft = {
		javascript = { "eslint_d", "cspell" },
		javascriptreact = { "eslint_d", "cspell" },
		typescript = { "eslint_d", "cspell" },
		typescriptreact = { "eslint_d", "cspell" },
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
