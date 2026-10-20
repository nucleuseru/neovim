local map = require("core/mappings").map

local function config()
	local text_objects = require("nvim-treesitter-textobjects")
	local text_objects_select = require("nvim-treesitter-textobjects.select")
	local text_objects_move = require("nvim-treesitter-textobjects.move")

	text_objects.setup({ move = { set_jumps = true } })

	map({ "x", "o" }, "am", function()
		text_objects_select.select_textobject("@function.outer", "textobjects")
	end, { desc = "Select outer function" })

	map({ "x", "o" }, "im", function()
		text_objects_select.select_textobject("@function.inner", "textobjects")
	end, { desc = "Select inner function" })

	map({ "x", "o" }, "ac", function()
		text_objects_select.select_textobject("@class.outer", "textobjects")
	end, { desc = "Select outer class" })

	map({ "x", "o" }, "ic", function()
		text_objects_select.select_textobject("@class.inner", "textobjects")
	end, { desc = "Select inner class" })

	map({ "x", "o" }, "as", function()
		text_objects_select.select_textobject("@local.scope", "locals")
	end, { desc = "Select scope" })

	map({ "n", "x", "o" }, "]m", function()
		text_objects_move.goto_next_start("@function.outer", "textobjects")
	end, { desc = "Next function start" })

	map({ "n", "x", "o" }, "]]", function()
		text_objects_move.goto_next_start("@class.outer", "textobjects")
	end, { desc = "Next class start" })

	map({ "n", "x", "o" }, "]o", function()
		text_objects_move.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
	end, { desc = "Next loop start" })

	map({ "n", "x", "o" }, "]s", function()
		text_objects_move.goto_next_start("@local.scope", "locals")
	end, { desc = "Next scope start" })

	map({ "n", "x", "o" }, "]z", function()
		text_objects_move.goto_next_start("@fold", "folds")
	end, { desc = "Next fold start" })

	map({ "n", "x", "o" }, "]M", function()
		text_objects_move.goto_next_end("@function.outer", "textobjects")
	end, { desc = "Next function end" })

	map({ "n", "x", "o" }, "][", function()
		text_objects_move.goto_next_end("@class.outer", "textobjects")
	end, { desc = "Next class end" })

	map({ "n", "x", "o" }, "[m", function()
		text_objects_move.goto_previous_start("@function.outer", "textobjects")
	end, { desc = "Previous function start" })

	map({ "n", "x", "o" }, "[[", function()
		text_objects_move.goto_previous_start("@class.outer", "textobjects")
	end, { desc = "Previous class start" })

	map({ "n", "x", "o" }, "[M", function()
		text_objects_move.goto_previous_end("@function.outer", "textobjects")
	end, { desc = "Previous function end" })

	map({ "n", "x", "o" }, "[]", function()
		text_objects_move.goto_previous_end("@class.outer", "textobjects")
	end, { desc = "Previous class end" })

	map({ "n", "x", "o" }, "]c", function()
		text_objects_move.goto_next("@conditional.outer", "textobjects")
	end, { desc = "Next conditional" })

	map({ "n", "x", "o" }, "[C", function()
		text_objects_move.goto_previous("@conditional.outer", "textobjects")
	end, { desc = "Previous conditional" })
end

return { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main", config = config }
