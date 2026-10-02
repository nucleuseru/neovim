local map = require("core/mappings").map

local function config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			html = { "oxfmt", "prettierd" },
			css = { "oxfmt", "prettierd" },
			javascript = { "oxfmt", "prettierd" },
			javascriptreact = { "oxfmt", "prettierd" },
			typescript = { "oxfmt", "prettierd" },
			typescriptreact = { "oxfmt", "prettierd" },
			json = { "oxfmt", "prettierd" },
			jsonc = { "oxfmt", "prettierd" },
			yaml = { "oxfmt", "prettierd" },
			rust = { "rustfmt" },
			python = { "black" },
		},
	})

	map({ "n", "i" }, "<C-f>", function()
		require("conform").format({ async = true, lsp_format = "fallback" })
	end, { desc = "format" })

	map({ "n", "i" }, "<leader>lf", function()
		require("conform").format({ async = true, lsp_format = "fallback" })
	end, { desc = "format" })
end

return {
	{ "stevearc/conform.nvim", config = config },
}
