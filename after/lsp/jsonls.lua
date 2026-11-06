return {
	--- @type lspconfig.settings.jsonls
	settings = {
		json = {
			schemas = Schemastore.json.schemas(),
			validate = { enable = true },
		},
	},
}
