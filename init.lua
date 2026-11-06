vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local o = vim.o

o.clipboard = "unnamedplus"
o.mouse = "a"
o.undofile = true
o.swapfile = false
o.updatetime = 200
o.timeoutlen = 300
o.virtualedit = "block"
o.confirm = true
o.grepprg = "rg --vimgrep"

o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.termguicolors = true
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.showmode = false
o.conceallevel = 2
o.laststatus = 3
o.list = false
o.shortmess = "CFOSWImwsco"
o.breakindent = true
o.smoothscroll = true
o.pumborder = "single"
o.winborder = "single"

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.autoindent = true

o.ignorecase = true
o.smartcase = true
o.inccommand = "split"

o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"

o.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99
o.foldenable = true

vim.filetype.add({
	filename = {
		["app.json"] = "jsonc",
		["tsconfig.json"] = "jsonc",
	},
})

local tokyonight = require("tokyonight")
_G.Tokyonight = tokyonight
Tokyonight.setup()
vim.cmd("color tokyonight-night")

local treesitter = require("nvim-treesitter")
_G.Treesitter = treesitter
Treesitter.setup()

local misc = require("mini.misc")
misc.setup()
misc.setup_restore_cursor()

_G.now = function(f)
	misc.safely("now", f)
end

_G.later = function(f)
	misc.safely("later", f)
end

---@param modes string|string[] Mode "short-name" (see |nvim_set_keymap()|), or a list thereof.
---@param lhs string           Left-hand side |{lhs}| of the mapping.
---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? vim.keymap.set.Opts
_G.map = function(modes, lhs, rhs, opts)
	local default_opts = {
		silent = true,
		noremap = true,
	}

	later(function()
		vim.keymap.set(modes, lhs, rhs, vim.tbl_extend("force", default_opts, opts))
	end)
end
