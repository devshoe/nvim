-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local function cur_filename()
	local cwd = vim.fn.getcwd()
	local filename = vim.split(cwd, "/")
	cwd = filename[#filename]
	return cwd
end

vim.api.nvim_create_autocmd("BufNew", {
	pattern = "copilot-chat",
	callback = function()
		local curtime = os.date("%Y%m%d%H%M%S")
		local cfile = cur_filename()
		-- we want to only get the last part of the path
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<C-L>",
			":CopilotChatSave " .. cfile .. "_" .. curtime .. "<CR>:CopilotChatReset<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"q",
			":CopilotChatSave " .. cwd .. "_" .. curtime .. "<CR>:CopilotChatClose<CR>"
		)
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.lua",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<leader>r", ":w<cr>:luafile %<CR>", { desc = "Run lua file" })
	end,
})
-- -- -- Import necessary modules
-- local telescope = require("telescope")
-- local pickers = require("telescope.pickers")
-- local finders = require("telescope.finders")
-- local sorters = require("telescope.sorters")
-- local previewers = require("telescope.previewers")
-- local actions = require("telescope.actions")
--
-- -- Define the custom function
-- local function custom_function(filename)
-- 	local file = vim.split(filename, "/")
-- 	local item = vim.split(file[#file], ".json")[1]
-- 	print(file)
-- 	vim.cmd(":CopilotChatLoad " .. item .. "<CR>")
-- end
--
-- -- Define the custom picker
-- local function custom_picker()
-- 	pickers
-- 		.new({}, {
-- 			prompt_title = "Custom Picker",
-- 			finder = finders.new_oneshot_job(
-- 				{ "find", ".", "-type", "f" }, -- Replace with your command to list files
-- 				{ cwd = vim.fn.stdpath("data") .. "/copilotchat_history" } -- Replace with your directory
-- 			),
-- 			sorter = sorters.get_fuzzy_file(),
-- 			previewer = previewers.vim_buffer_cat.new({}),
-- 			attach_mappings = function(_, map)
-- 				map("n", "<CR>", function(prompt_bufnr)
-- 					cur_sel = require("telescope.actions.state").get_current_picker(prompt_bufnr)
-- 					for key, value in pairs(cur_sel) do
-- 						print(key, value)
-- 					end
-- 				end)
-- 				return true
-- 			end,
-- 		})
-- 		:find()
-- end
-- -- Use the custom picker
-- custom_picker()
