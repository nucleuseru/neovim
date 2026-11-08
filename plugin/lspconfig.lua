vim.pack.add({
	"https://github.com/b0o/schemastore.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	{ src = "https://github.com/yioneko/nvim-vtsls", name = "vtsls" },
})

local mason = require("mason")
_G.Mason = mason
mason.setup()

local schemastore = require("schemastore")
_G.Schemastore = schemastore

local vtsls = require("vtsls")
_G.Vtsls = vtsls

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		client.server_capabilities.semanticTokensProvider = nil

		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
		end

		local lsp_map = function(mode, lhs, rhs, desc)
			map(mode, lhs, rhs, { buffer = args.buf, desc = desc })
		end

		lsp_map("n", "gR", "<cmd>FzfLua lsp_references<CR>", "Goto references")
		lsp_map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", "Goto definition")
		lsp_map("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", "Goto declaration")
		lsp_map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", "Goto implementation")
		lsp_map("n", "gy", "<cmd>FzfLua lsp_type_definitions<CR>", "Goto type definition")
		lsp_map({ "n", "v" }, "<leader>la", "<cmd>FzfLua lsp_code_actions<CR>", "Code action")
		lsp_map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", "Document symbols")
		lsp_map("n", "<leader>lS", "<cmd>FzfLua lsp_workspace_symbols<CR>", "Workspace symbols")
		lsp_map("n", "<leader>lD", "<cmd>FzfLua diagnostics_document<CR>", "Document diagnostics")
		lsp_map("n", "<leader>lw", "<cmd>FzfLua diagnostics_workspace<CR>", "Workspace diagnostics")

		lsp_map("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, "Hover documentation")

		lsp_map("n", "gK", function()
			vim.lsp.buf.signature_help({ border = "single" })
		end, "Signature help")

		lsp_map("n", "gl", vim.diagnostic.open_float, "Line diagnostics")
		lsp_map("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
		lsp_map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, "Code action")
		lsp_map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")

		lsp_map("n", "[e", function()
			vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
		end, "Previous error")

		lsp_map("n", "]e", function()
			vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
		end, "Next error")

		lsp_map("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
		end, "Toggle inlay hints")

		if client.name == "vtsls" then
			lsp_map("n", "<leader>lo", function()
				vtsls.commands.organize_imports(args.buf)
			end, "Organize imports")

			lsp_map("n", "<leader>lm", function()
				vtsls.commands.add_missing_imports(args.buf)
			end, "Add missing imports")

			lsp_map("n", "<leader>lu", function()
				vtsls.commands.remove_unused_imports(args.buf)
			end, "Remove unused imports")

			lsp_map("n", "<leader>lF", function()
				vtsls.commands.fix_all(args.buf)
			end, "Fix all")

			lsp_map("n", "<leader>lG", function()
				vtsls.commands.goto_source_definition(0)
			end, "Goto source definition")
		end
	end,
})

local function lsp_format(client)
	local formatters = { "stylua", "oxfmt", "clangd", "rust_analyzer", "docker-language-server" }
	for _, value in ipairs(formatters) do
		if value == client.name then
			return true
		end
	end
	return false
end

local format_buffer = function()
	vim.lsp.buf.format({ async = true, filter = lsp_format })
end

map({ "n", "x" }, "<leader>lf", format_buffer, { desc = "Format buffer" })
map({ "n", "x" }, "<C-f>", format_buffer, { desc = "Format buffer" })

map("n", "<leader>lA", function()
	if vim.lsp.is_enabled("fallow") then
		vim.cmd("lsp stop fallow")
	else
		vim.cmd("lsp enable fallow")
	end
end, { desc = "Toggle analyser" })

later(function()
	local x = vim.diagnostic.severity

	vim.diagnostic.config({
		underline = true,
		update_in_insert = true,
		severity_sort = true,
		float = {
			border = "single",
		},
		virtual_text = {
			current_line = true,
			severity = { min = x.WARN, max = x.ERROR },
		},
		signs = {
			text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" },
		},
	})

	vim.lsp.config("*", {
		capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			BlinkCmp.get_lsp_capabilities()
		),
	})

	local servers = {
		"lua_ls",
		-- "vtsls",
    "tsrs",
		"stylua",
		"oxfmt",
		"oxlint",
		"jsonls",
		"yamlls",
		"clangd",
		"rust_analyzer",
		"pyright",
		"html",
		"cssls",
		"tailwindcss",
		"dockerls",
		"harper_ls",
	}

	for _, server in ipairs(servers) do
		vim.lsp.enable(server)
	end
end)
