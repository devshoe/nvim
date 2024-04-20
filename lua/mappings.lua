local M = {}
local map = vim.keymap.set

M.page_navigation = function()
	map("n", "<C-d>", "<C-d>zz", { desc = "Down half page" })
	map("n", "<C-u>", "<C-u>zz", { desc = "Up half page" })

	map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
	map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
	map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
	map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

	map({ "n", "v" }, "[d", vim.diagnostic.goto_prev, { desc = "[C]ode Diagnostic [D]own" })
	map({ "n", "v" }, "]d", vim.diagnostic.goto_next, { desc = "[C]ode Diagnostic [U]p" })

	--goto next function
	map("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- okay, so y,s,c,x,d are the commands that delete or copy to clipboard
	-- if we want y to work as is.
	-- disable yanking completely for s and c in all modes
	-- disable yanking for x in normal mode
	-- disable yanking for d in visual mode
	-- open question: do we want deletion yank in normal mode?
	map({ "v" }, "d", '"dd', { desc = "Delete without yanking" })
	map({ "v", "n" }, "c", '"cc', { desc = "Delete and Enter Insert without yanking" })
	map({ "n" }, "s", '"ss', { desc = "Delete and Enter Insert without yanking" })
	map({ "n" }, "S", '"sS', { desc = "Delete and Enter Insert without yanking" })
	map({ "n" }, "x", '"_x', { desc = "Delete Character Under Cursor" })
end

M.buffer_navigation = function()
	map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close Current Buffer" })
	map("n", "<leader>x", "<cmd>q<CR>", { desc = "Close current window/pane" })
	map("n", "]b", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
	map("n", "[b", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
	-- map("n", "}", "]m", { desc = "Next {" })
end

M.window_navigation = function()
	map({ "n", "v" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move focus to the left window" })
	map({ "n", "v" }, "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move focus to the right window" })
	map({ "n", "v" }, "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move focus to the lower window" })
	map({ "n", "v" }, "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move focus to the upper window" })
	map({ "n", "v" }, "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Move focus to the previous window" })
	map("n", "<C-w>z", "<cmd>WindowsMaximize<cr>", { desc = "Maximize current window" })
	map("n", "<C-w>_", "<cmd>WindowsMaximizeVertically<cr>", { desc = "Maximize current window vertically" })
	map("n", "<C-w>|", "<cmd>WindowsMaximizeHorizontally<cr>", { desc = "Maximize current window horizontally" })
	map("n", "<C-w>=", "<cmd>WindowsEqualize<cr>", { desc = "Equalize window sizes" })
end

M.harpoon = function()
	map("n", "<leader>hh", function()
		require("harpoon.ui").toggle_quick_menu()
	end, { desc = "Toggle Harpoon" })
	map("n", "<leader>ha", function()
		require("harpoon.mark").add_file()
	end, { desc = "Add Harpoon Mark" })
end
-- terminal sets commands only applicable inside tmux sessions like split horizontal, vertical and maximize
M.terminal = function()
	map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

	map(
		{ "n", "v" },
		"<leader>ts",
		'<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>',
		{ desc = "Toggle Terminals" }
	)
	map(
		{ "n", "v" },
		"<leader>tv",
		'<Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>',
		{ desc = "Toggle Terminals" }
	)
	map({ "n", "v" }, "<leader>tt", "<cmd>ToggleTermToggleAll<CR>", { desc = "toggle all terminals" })
	map({ "n", "v" }, "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Split terminal vertically" })
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Switch Window" })
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Switch Window" })
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Switch Window" })
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Switch Window" })
	-- map({ "n", "v" }, "<leader>ts", "<cmd>!tmux split-window -v -l 15 <CR>", { desc = "Tmux new horizontal split" })
	-- map({ "n", "v" }, "<leader>tv", "<cmd>!tmux split-window -h -l 30 <CR>", { desc = "Tmux new vertical split" })
	-- map({ "n", "v" }, "<leader>tt", "<cmd>!tmux resize-pane -Z<CR><CR>", { desc = "Toggle terminal" })
end

M.telescope = function()
	local builtin = require("telescope.builtin")
	map("n", "<leader>fK", builtin.help_tags, { desc = "[F]ind [H]elp" })
	map("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
	map("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
	map("n", "<leader>fx", builtin.builtin, { desc = "[F]ind Select Telescope" })
	map("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
	map("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
	map("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
	map("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
	map("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
	map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
	map("n", "<leader>ft", builtin.colorscheme, { desc = "[F]ind [T]heme" })
	map("n", "<leader>fm", builtin.marks, { desc = "[F]ind [M]arks" })
	map("n", "<leader>fh", ":Telescope harpoon marks", { desc = "[F]ind [H]arpoon Marks" })
	map("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "[F]ind in current [B]uffer" })
	-- for visual selection
	-- Find selected word under cursor
	map(
		"v",
		"<leader>fw",
		'"zy<Cmd>lua require("telescope.builtin").grep_string({search=vim.trim(vim.fn.getreg("z"))})<CR>',
		{ desc = "[F]ind selected [W]ords" }
	)
	-- Slightly advanced example of overriding default behavior and theme

	-- Shortcut for searching your Neovim configuration files
	map("n", "<leader>fn", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[F]ind [N]eovim files" })

	map("n", "<leader>acs", function()
		builtin.find_files({ cwd = vim.fn.stdpath("data") .. "/copilotchat_history" })
	end, { desc = "[S]earch [C]opilot Chat" })
end

M.dadbod = function()
	map("n", "<leader>dbo", "<cmd>DBUI<CR>", { desc = "Open DB UI" })
	map("n", "<leader>dba", "<cmd>DBUIAddConnection<CR>", { desc = "Add DB Connection" })
	map("n", "<leader>dbf", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB Open Buffers" })
	map("n", "<leader>dbx", "<cmd>DBUIClose<CR>", { desc = "Close DB Buffers" })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "sql",
		callback = function()
			---@diagnostic disable-next-line: redefined-local
			local function map(mode, lhs, rhs, opts)
				local bufnr = vim.api.nvim_get_current_buf()
				vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
			end

			map("n", "<leader>dbr", "<Plug>(DBUI_ExecuteQuery)", { desc = "Execute current file" })
			map("v", "<leader>dbr", "<Plug>(DBUI_ExecuteQuery)", { desc = "Execute current selection" })
			map("n", "<leader>dbs", "<Plug>(DBUI_SaveQuery)", { desc = "Save Current Query" })
		end,
	})
end

M.mini = {

	files = function()
		local open_minifiles = function()
			require("mini.files").open(vim.api.nvim_buf_get_name(0))
		end
		map({ "n", "v" }, "<C-n>", open_minifiles, { desc = "Open file explorer" })
	end,

	comment = function()
		return {
			comment = "gc",
			comment_line = "gcc",
			comment_visual = "gc",
			textobject = "gc",
		}
	end,
}

M.sessions = function()
	map("n", "<leader>sf", "<cmd>SearchSession<CR>", { desc = "Session Find" })
	map("n", "<leader>ss", function()
		vim.cmd("wa")
		vim.cmd("SessionSave")
	end, { desc = "Session Save" })
	map("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Session Delete" })
	map("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Session Restore" })
end

M.ai = {

	copilot_chat = function()
		map({ "n", "v" }, "<leader>ace", "<cmd>CopilotChatExplain<CR>", { desc = "[A]I [C]opilot [E]xplain" })
		map({ "n", "v" }, "<leader>acc", "<cmd>CopilotChatToggle<CR>", { desc = "[A]I [C]opilot Toggle [C]hat Window" })
		map({ "n", "v" }, "<leader>aco", "<cmd>CopilotChatOptimize<CR>", { desc = "[A]I [C]opilot [O]ptimize" })
		map({ "n", "v" }, "<leader>act", "<cmd>CopilotChatTests<CR>", { desc = "[A]I [C]opilot Generate [T]ests" })
		map({ "n", "v" }, "<leader>acd", "<cmd>CopilotChatDocs<CR>", { desc = "[A]I [C]opilot Generate [D]ocs" })
		map({ "n", "v" }, "<leader>acf", "<cmd>CopilotChatFix<CR>", { desc = "[A]I [C]opilot [F]ix Code" })
	end,
}

-- we map both luasnip and cmp bindings here
--

M.cmp = function()
	local has_words_before = function()
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
	end

	local cmp = require("cmp")
	local luasnip = require("luasnip")
	return {
		["<C-n>"] = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				cmp.mapping.complete()
			end
		end,

		["<C-p>"] = function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				cmp.mapping.complete()
			end
		end,

		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-x>"] = cmp.mapping.close(),
		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),

		-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
		--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
	}
end

-- used internally
M.lsp = function(event)
	---@diagnostic disable-next-line: redefined-local
	local map = function(keys, func, desc)
		map("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end
	local telescope = require("telescope.builtin")
	map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")
	map("gr", telescope.lsp_references, "[G]oto [R]eferences")
	map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")
	map("<leader>fsb", telescope.lsp_document_symbols, "[F]ind [S]ymbols in [B]uffer")
	map("<leader>fsw", telescope.lsp_dynamic_workspace_symbols, "[F]ind [S]ymbols in [W]orkspace")
	map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename Variable")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("<leader>ce", vim.diagnostic.open_float, "[C]ode Diagnostic [E]rror messages")
	map("<leader>cq", vim.diagnostic.setloclist, "[C]ode Diagnostic [Q]uickfix list")
	map("<leader>co", function()
		vim.cmd("Outline")
	end, "[C]ode Symbols [O]utline")
	map("<leader>cl", function()
		vim.cmd("LspRestart")
	end, "[C]ode [L]SP Restart")
	map("K", vim.lsp.buf.hover, "Hover Documentation")
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
end

M.language_specific = {
	go = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "go",
			callback = function()
				vim.api.nvim_buf_set_keymap(
					0,
					"n",
					"<F5>",
					':echo "This is a go file"<CR>',
					{ noremap = true, silent = true }
				)
			end,
		})
	end,
}

return M
