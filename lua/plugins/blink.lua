return {
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdLineEnter" },
		dependencies = {
			"saghen/blink.lib",
			"rafamadriz/friendly-snippets",

			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",

				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},

		build = function()
			require("blink.cmp").build():pwait()
		end,

		opts = {
			keymap = { preset = "enter" },
			snippets = { preset = "luasnip" },

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
		},
	},
}
