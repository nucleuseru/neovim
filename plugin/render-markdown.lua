vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

local render_markdown = require("render-markdown")
_G.RenderMarkdown = render_markdown

later(function()
	render_markdown.setup({
		completions = {
			lsp = { enabled = true },
		},
	})
end)

map("n", "<leader>tm", function()
	render_markdown.toggle()
end, { desc = "Toggle Render Markdown" })
