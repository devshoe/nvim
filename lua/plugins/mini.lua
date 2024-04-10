local files_set_cwd = function(path)
	-- Works only if cursor is on the valid file system entry
	local cur_entry_path = require("mini.files").get_fs_entry().path
	local cur_directory = vim.fs.dirname(cur_entry_path)
	vim.fn.chdir(cur_directory)
	print("changed cwd to `" .. cur_directory .. "`")
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		vim.keymap.set("n", "<C-]>", files_set_cwd, { buffer = args.data.buf_id })
	end,
})

local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		-- Make new window and set it as target
		local new_target_window
		vim.api.nvim_win_call(require("mini.files").get_target_window(), function()
			vim.cmd(direction .. " split")
			new_target_window = vim.api.nvim_get_current_win()
		end)

		require("mini.files").set_target_window(new_target_window)
	end

	-- Adding `desc` will result into `show_help` entries
	local desc = "Split " .. direction
	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		-- Tweak keys to your liking
		map_split(buf_id, "gs", "belowright horizontal")
		map_split(buf_id, "gv", "belowright vertical")
	end,
})
return {
	"echasnovski/mini.nvim",
	lazy = false,
	config = function()
		local opts = require("configs.mini")
		require("mini.files").setup(opts.files)
		-- require("mini.animate").setup(opts.animate)
		require("mini.comment").setup(opts.comment)
		require("mini.statusline").setup(opts.statusline)
		-- require("mini.cursorword").setup(opts.cursorword)
	end,
}
