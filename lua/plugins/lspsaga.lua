local map = require("core/mappings").map

local function config()
	require("lspsaga").setup({
    symbol_in_winbar = {
      enable = false
    }
  })

	map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "code action" })
	map("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "next diagnostic" })
	map("n", "<leader>ld", "<cmd>Lspsaga finder def<cr>", { desc = "definition" })
	map("n", "<leader>lD", "<cmd>Lspsaga finder ref+imp<cr>", { desc = "definition" })
	map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "outline" })
	map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "rename" })
	map("n", "gc", "<cmd>Lspsaga code_action<cr>", { desc = "code action" })
	map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "next diagnostic" })
	map("n", "gr", "<cmd>Lspsaga rename<cr>", { desc = "rename" })
	map("n", "go", "<cmd>Lspsaga outline<cr>", { desc = "outline" })
	map("n", "gd", "<cmd>Lspsaga finder def<cr>", { desc = "definition" })
	map("n", "gD", "<cmd>Lspsaga finder ref+imp<cr>", { desc = "references" })
	-- map("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "hover" })
end

return {
	{ "nvimdev/lspsaga.nvim", event = "LspAttach", config = config },
}
