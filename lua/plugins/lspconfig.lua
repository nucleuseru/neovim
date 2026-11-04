local map = require("core/mappings").map

local function config()
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

			if not client then
				return
			end

			client.server_capabilities.semanticTokensProvider = nil

			local lsp_map = function(mode, lhs, rhs, desc)
				map(mode, lhs, rhs, { buffer = args.buf, desc = desc })
			end

			-- LSP navigation & information
			lsp_map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", "Goto definition")
			lsp_map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", "Goto declaration")
			lsp_map("n", "gr", "<cmd>FzfLua lsp_references<CR>", "Goto references")
			lsp_map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", "Goto implementation")
			lsp_map("n", "gy", "<cmd>FzfLua lsp_type_definitions<CR>", "Goto type definition")
			lsp_map("n", "gl", vim.diagnostic.open_float, "Line diagnostics")
			lsp_map("n", "K", vim.lsp.buf.hover, "Hover documentation")
			lsp_map("n", "gK", vim.lsp.buf.signature_help, "Signature help")

			-- LSP actions under <leader>l
			lsp_map({ "n", "v" }, "<leader>la", "<cmd>FzfLua lsp_code_actions<CR>", "Code action")
			lsp_map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", "Document symbols")
			lsp_map("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", "Workspace symbols")
			lsp_map("n", "<leader>lD", "<cmd>FzfLua diagnostics_document<CR>", "Document diagnostics")
			lsp_map("n", "<leader>lw", "<cmd>FzfLua diagnostics_workspace<CR>", "Workspace diagnostics")
			lsp_map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
			lsp_map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")

			-- Diagnostics navigation
			lsp_map("n", "[d", function()
				vim.diagnostic.jump({ count = -1 })
			end, "Previous diagnostic")

			lsp_map("n", "]d", function()
				vim.diagnostic.jump({ count = 1 })
			end, "Next diagnostic")

			lsp_map("n", "[e", function()
				vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
			end, "Previous error")

			lsp_map("n", "]e", function()
				vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
			end, "Next error")
		end,
	})

	local function lsp_format(client)
		local formatters = { "stylua", "oxfmt", "clangd", "rust-analyzer", "docker-language-server" }
		for _, value in ipairs(formatters) do
			if value == client.name then
				return true
			end
		end
		return false
	end

	map("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = true, filter = lsp_format })
	end, { desc = "Format" })

	map("n", "<C-f>", function()
		vim.lsp.buf.format({ async = true, filter = lsp_format })
	end, { desc = "Format" })

	require("lspconfig.configs").vtsls = require("vtsls").lspconfig

	local capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		require("blink.cmp").get_lsp_capabilities(require("nvim-file-operations.config").default_capabilities())
	)

	if capabilities.workspace then
		capabilities.workspace.didChangeWatchedFiles = { dynamicRegistration = false }
	end

	vim.lsp.config("*", { capabilities = capabilities })

	vim.lsp.config("vtsls", {
		settings = {
			vtsls = {
				autoUseWorkspaceTsdk = true,
				experimental = {
					completion = { enableServerSideFuzzyMatch = true },
				},
			},
			typescript = {
				tsserver = {
					maxTsServerMemory = 8192,
				},
			},
		},
	})

	vim.lsp.config("lua_ls", {
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
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})

	vim.lsp.config("yamlls", {
		settings = {
			yaml = {
				schemaStore = { enable = false, url = "" },
				schemas = require("schemastore").yaml.schemas(),
			},
		},
	})

	vim.lsp.config("fallow", {
		cmd = { "fallow-lsp" },
		cmd_env = { FALLOW_LSP_REUSE_SESSION = "0" },
		filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
		root_markers = { ".fallowrc.json", "package.json", ".git" },
		init_options = {
			prewarm = true,
		},
	})

	vim.lsp.enable("oxfmt")
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	callback = function(args)
		vim.keymap.set("n", "<leader>lA", function()
			if vim.lsp.is_enabled("fallow") then
				vim.cmd([[lsp disable fallow]])
				vim.notify("Fallow LSP disabled", vim.log.levels.INFO)
			else
				vim.cmd([[lsp enable fallow]])
				vim.notify("Fallow LSP enabled", vim.log.levels.INFO)
			end
		end, { buffer = args.buf, desc = "Toggle analyser", silent = true })
	end,
})

return {
	"b0o/schemastore.nvim",
	{ "mason-org/mason.nvim", opts = {} },
	{ "mason-org/mason-lspconfig.nvim", opts = { automatic_enable = true } },
	{ "yioneko/nvim-vtsls", name = "vtsls" },
	{ "neovim/nvim-lspconfig", config = config },
}
