return {
	--- @type lspconfig.settings.vtsls
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
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
		javascript = {
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
}
