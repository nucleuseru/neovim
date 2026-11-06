vim.pack.add({
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
})

local blink = require("blink.cmp")
_G.BlinkCmp = blink

blink.setup({
	keymap = { preset = "enter" },

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 250,
			window = { border = "single" },
		},
		list = {
			selection = { preselect = false, auto_insert = true },
		},
		menu = {
			border = "single",
			auto_show = function(ctx)
				return ctx.mode ~= "default"
			end,
		},
	},

	signature = {
		enabled = true,
		window = { border = "single", show_documentation = false },
	},

	cmdline = {
		completion = {
			list = { selection = { preselect = false } },
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			lua = { "lazydev", inherit_defaults = true },
		},
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
