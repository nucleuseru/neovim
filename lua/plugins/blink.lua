local function config()
	require("blink.cmp").setup({
		keymap = { preset = "enter" },

		completion = {
			documentation = { auto_show = false },
		},

		signature = {
			enabled = true,
			window = { show_documentation = false },
		},

		cmdline = {
			completion = {
				list = { selection = { preselect = false } },
			},
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		fuzzy = { implementation = "rust" },
	})
end

return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"saghen/blink.lib",
			"rafamadriz/friendly-snippets",
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,
		config = config,
	},
}
