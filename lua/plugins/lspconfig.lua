local map = require("core/mappings").map

function config()
	local x = vim.diagnostic.severity

	vim.diagnostic.config({
		underline = true,
		virtual_text = {
			current_line = true,
			severity = vim.diagnostic.severity.ERROR,
		},
		signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)

			if client and client.name == "cspell_ls" then
				local ns = vim.lsp.diagnostic.get_namespace(client.id)
				vim.diagnostic.config({ signs = false }, ns)
			end
		end,
	})

	require("lspconfig.configs").vtsls = require("vtsls").lspconfig

	vim.lsp.config("*", {
		capabilities = require("nvim-file-operations.config").default_capabilities(),
	})

	vim.lsp.config("vtsls", {
		---@type lspconfig.settings.vtsls
		settings = {
			typescript = {
				inlayHints = {
					parameterNames = { enabled = "literals" },
					parameterTypes = { enabled = true },
					variableTypes = { enabled = true },
					propertyDeclarationTypes = { enabled = true },
					functionLikeReturnTypes = { enabled = true },
					enumMemberValues = { enabled = true },
				},
			},
		},
	})

	vim.lsp.config("lua_ls", {
		---@type lspconfig.settings.lua_ls
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					preloadFileSize = 10000,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			},
		},
	})

	vim.lsp.config("jsonls", {
		---@type lspconfig.settings.jsonls
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})

	vim.lsp.config("yamlls", {
		---@type lspconfig.settings.yamlls
		settings = {
			yaml = {
				schemaStore = { enable = false, url = "" },
				schemas = require("schemastore").yaml.schemas(),
			},
		},
	})

	map("n", "<leader>lR", "<cmd>VtsExec restart_tsserver<cmd>", { desc = "restart typescript server" })
	map("n", "<leader>lO", "<cmd>VtsExec organize_imports<cmd>", { desc = "organize typescript imports" })
	map("n", "<leader>lS", "<cmd>VtsExec select_ts_version<cmd>", { desc = "select typescript workspace version" })
end

return {
	"b0o/schemastore.nvim",
	{ "mason-org/mason.nvim", opts = {} },
	{ "mason-org/mason-lspconfig.nvim", opts = { automatic_enable = true } },
	{ "yioneko/nvim-vtsls", name = "vtsls", confg = false },
	{ "neovim/nvim-lspconfig", config = config },
}
