local files_set_cwd = function(path)
	-- Works only if cursor is on the valid file system entry
	local cur_entry_path = require("mini.files").get_fs_entry().path
	local cur_directory = vim.fs.dirname(cur_entry_path)
	vim.fn.chdir(cur_directory)
	print("changed cwd to `{cur_directory}`")
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		vim.keymap.set("n", "<C-]>", files_set_cwd, { buffer = args.data.buf_id })
	end,
})

return {
	"echasnovski/mini.nvim",
	lazy = false,
	config = function()
		local opts = require("configs.mini")
		require("mini.files").setup(opts.files)
		require("mini.animate").setup(opts.animate)
		require("mini.comment").setup(opts.comment)
		require("mini.statusline").setup(opts.statusline)
		require("mini.cursorword").setup({})
	end,
}
