local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Automatically resize window splits when the Neovim host window is resized
autocmd("VimResized", {
	group = augroup("resize_splits", { clear = true }),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Close specific informational or helper filetypes instantly by pressing 'q'
autocmd("FileType", {
	group = augroup("close_with_q", { clear = true }),
	pattern = { "help", "man", "fugitive", "lspinfo", "notify", "qf" },
	callback = function(args)
		map("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
	end,
})

-- Automatically create missing parent directories on save if they do not exist yet
autocmd("BufWritePre", {
	group = augroup("auto_create_dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Automatically check if buffers have been changed outside of Neovim and reload them
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime", { clear = true }),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Automatically attach and start Treesitter highlighting for supported filetypes
autocmd("FileType", {
	callback = function(ev)
		pcall(function()
			vim.treesitter.start(ev.buf)
		end)
	end,
})

-- Automatically change explorer root directory
autocmd("BufEnter", {
	callback = function(data)
		if vim.bo[data.buf].buftype ~= "" then
			return
		end

		local name = vim.api.nvim_buf_get_name(data.buf)
		if name == "" then
			return
		end

		if data.buf ~= vim.api.nvim_get_current_buf() then
			return
		end

		local root = MiniMisc.find_root(data.buf, { "node_modules", "package.json", "tsconfig.json", ".git" })
		if root == nil then
			return
		end

		vim.fn.chdir(root)
		NvimTreeApi.tree.change_root(root)
	end,
})
