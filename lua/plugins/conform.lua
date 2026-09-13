local map = require("core/mappings").map

local function config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			html = { "prettierd" },
			css = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
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
