return {
	cmd = { "fallow-lsp" },
	cmd_env = { FALLOW_LSP_REUSE_SESSION = "0" },
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	root_markers = { ".fallowrc.json", "package.json", ".git" },
	init_options = {
		prewarm = true,
	},
}
