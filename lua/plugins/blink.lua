local function config()
	require("blink.cmp").setup({
		keymap = { preset = "enter" },

		completion = {
			documentation = { auto_show = false },
			list = { selection = { preselect = false, auto_insert = true } },
			menu = {
				auto_show = function(ctx)
					return ctx.mode ~= "default"
				end,
			},
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
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "rust" },
	})
end

return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.lib",
		"rafamadriz/friendly-snippets",
	},
	build = function()
		require("blink.cmp").build():pwait()
	end,
	config = config,
}
