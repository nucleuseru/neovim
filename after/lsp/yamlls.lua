return {
	--- @type lspconfig.settings.yamlls
	settings = {
		yaml = {
			schemaStore = { enable = false, url = "" },
			schemas = Schemastore.yaml.schemas(),
		},
	},
}
