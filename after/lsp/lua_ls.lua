return {
	--- @type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				preloadFileSize = 10000,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
			telemetry = { enable = false },
			hint = { enable = true },
		},
	},
}
