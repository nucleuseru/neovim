local M = {}

local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})

	vim.keymap.set(mode, lhs, rhs, opts)
end

M.map = map

map("n", "<Esc>", "<cmd>noh<cr>", { desc = "clear highlights" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "save" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "save" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "move to right window" })

-- Better indent in visual mode
map("v", "<S-Tab>", "<gv", { desc = "indent left" })
map("v", "<Tab>", ">gv", { desc = "indent right" })

return M
