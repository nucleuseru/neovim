local map = require("core/mappings").map

local function config()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			html = { "oxfmt" },
			css = { "oxfmt" },
			javascript = { "oxfmt" },
			javascriptreact = { "oxfmt" },
			typescript = { "oxfmt" },
			typescriptreact = { "oxfmt" },
			json = { "oxfmt" },
			jsonc = { "oxfmt" },
			yaml = { "oxfmt" },
			rust = { "rustfmt" },
			python = { "black" },
		},
	})

	map({ "n", "i" }, "<C-f>", function()
		conform.format({ async = true, lsp_format = "fallback" })
	end, { desc = "format" })

	map({ "n", "i" }, "<leader>lf", function()
		conform.format({ async = true, lsp_format = "fallback" })
	end, { desc = "format" })
end

return { "stevearc/conform.nvim", config = config }
