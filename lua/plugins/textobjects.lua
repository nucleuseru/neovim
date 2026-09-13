local map = require("core/mappings").map

local function config()
	require("nvim-treesitter-textobjects").setup({
		move = {
			set_jumps = true,
		},
	})

	vim.keymap.set({ "x", "o" }, "am", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
	end, { desc = "Select outer function" })

	vim.keymap.set({ "x", "o" }, "im", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
	end, { desc = "Select inner function" })

	vim.keymap.set({ "x", "o" }, "ac", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
	end, { desc = "Select outer class" })

	vim.keymap.set({ "x", "o" }, "ic", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
	end, { desc = "Select inner class" })

	vim.keymap.set({ "x", "o" }, "as", function()
		require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
	end, { desc = "Select scope" })

	vim.keymap.set({ "n", "x", "o" }, "]m", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
	end, { desc = "Next function start" })

	vim.keymap.set({ "n", "x", "o" }, "]]", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
	end, { desc = "Next class start" })

	vim.keymap.set({ "n", "x", "o" }, "]o", function()
		require("nvim-treesitter-textobjects.move").goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
	end, { desc = "Next loop start" })

	vim.keymap.set({ "n", "x", "o" }, "]s", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
	end, { desc = "Next scope start" })

	vim.keymap.set({ "n", "x", "o" }, "]z", function()
		require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
	end, { desc = "Next fold start" })

	vim.keymap.set({ "n", "x", "o" }, "]M", function()
		require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
	end, { desc = "Next function end" })

	vim.keymap.set({ "n", "x", "o" }, "][", function()
		require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
	end, { desc = "Next class end" })

	vim.keymap.set({ "n", "x", "o" }, "[m", function()
		require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
	end, { desc = "Previous function start" })

	vim.keymap.set({ "n", "x", "o" }, "[[", function()
		require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
	end, { desc = "Previous class start" })

	vim.keymap.set({ "n", "x", "o" }, "[M", function()
		require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
	end, { desc = "Previous function end" })

	vim.keymap.set({ "n", "x", "o" }, "[]", function()
		require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
	end, { desc = "Previous class end" })

	vim.keymap.set({ "n", "x", "o" }, "]d", function()
		require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
	end, { desc = "Next conditional" })

	vim.keymap.set({ "n", "x", "o" }, "[d", function()
		require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
	end, { desc = "Previous conditional" })
end

return {
	{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main", config = config },
}
