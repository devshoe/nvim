local M = {}
local map = vim.keymap.set

M.page_navigation = function()
	map("n", "<C-d>", "<C-d>zz", { desc = "Down half page" })
	map("n", "<C-u>", "<C-u>zz", { desc = "Up half page" })

	map("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
	map("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
	map("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
	map("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

	map("n", "<Esc>", "<cmd>nohlsearch<CR>")

	-- okay, so y,s,c,x,d are the commands that delete or copy to clipboard
	-- if we want y to work as is.
	-- disable yanking completely for s and c in all modes
	-- disable yanking for x in normal mode
	-- disable yanking for d in visual mode
	-- open question: do we want deletion yank in normal mode?
	map({ "v" }, "d", '"dd', { desc = "Delete without yanking" })
	map({ "v", "n" }, "c", '"cc', { desc = "Delete and Enter Insert without yanking" })
	map({ "v", "n" }, "s", '"ss', { desc = "Delete and Enter Insert without yanking" })
	map({ "v", "n" }, "S", '"sS', { desc = "Delete and Enter Insert without yanking" })
	map({ "n" }, "x", '"_x', { desc = "Delete Character Under Cursor" })
	map("n", "<S-Enter>", ":normal! o<CR>", { desc = "Insert new line" })
end

M.buffer_navigation = function()
	map("n", "<leader><Tab>", "<cmd>bn<CR>", { desc = "Next buffer" })
	map("n", "<leader><S-Tab>", "<cmd>bp<CR>", { desc = "Prev buffer" })
	map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close Current Buffer" })
	map("n", "<leader>x", "<cmd>q<CR>", { desc = "Close current window/pane" })
end

M.window_navigation = function()
	map({ "n", "v" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move focus to the left window" })
	map({ "n", "v" }, "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move focus to the right window" })
	map({ "n", "v" }, "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move focus to the lower window" })
	map({ "n", "v" }, "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move focus to the upper window" })
	map({ "n", "v" }, "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Move focus to the previous window" })
end

-- terminal sets commands only applicable inside tmux sessions like split horizontal, vertical and maximize
M.terminal = function()
	map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
	map({ "n", "v" }, "<leader>ts", "<cmd>!tmux split-window -v -l 15 <CR>", { desc = "Tmux new horizontal split" })
	map({ "n", "v" }, "<leader>tv", "<cmd>!tmux split-window -h -l 30 <CR>", { desc = "Tmux new vertical split" })
	map({ "n", "v" }, "<leader>tt", "<cmd>!tmux resize-pane -Z<CR><CR>", { desc = "Toggle terminal" })
end

M.telescope = function()
	local builtin = require("telescope.builtin")
	map("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
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
	-- for visual selection

	map(
		"v",
		"<leader>fw",
		'"zy<Cmd>lua require("telescope.builtin").grep_string({search=vim.trim(vim.fn.getreg("z"))})<CR>',
		{ desc = "[F]ind selected [W]ords" }
	)
	-- Slightly advanced example of overriding default behavior and theme
	map("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "[F]ind in current [B]uffer" })

	-- Shortcut for searching your Neovim configuration files
	map("n", "<leader>sn", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "[F]ind [N]eovim files" })

	map("n", "<leader>agg", function()
		builtin.find_files({ cwd = vim.fn.stdpath("data") .. "/copilotchat_history" })
	end, { desc = "[F]ind [G]ithub Copilot Chat" })
end

M.dadbod = function()
	map("n", "<leader>dbo", "<cmd>DBUI<CR>", { desc = "Open DB UI" })
	map("n", "<leader>dba", "<cmd>DBUIAddConnection<CR>", { desc = "Add DB Connection" })
	map("n", "<leader>dbf", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB Open Buffers" })
	map("n", "<leader>dbx", "<cmd>DBUIClose<CR>", { desc = "Close DB Buffers" })
end

M.mini = {
	files = function()
		local open_minifiles = function()
			require("mini.files").open()
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
	map("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Session Save" })
end

M.ai = {

	copilot = function()
		local toggle_copilot = function()
			local status = vim.fn.execute("Copilot status")
			if string.find(status, "Ready") then
				-- If Copilot is ready, disable it
				vim.cmd("Copilot disable")
				print("Copilot disabled")
			else
				-- If Copilot is not ready, enable it
				vim.cmd("Copilot enable")
				print("Copilot enabled")
			end
		end

		map("n", "<leader>acx", toggle_copilot, { desc = "AI Github Copilot Toggle" })
		map("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
			desc = "AI Github Copilot Accept",
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true

		map("i", "<C-q>", "<Plug>(copilot-dismiss)", { desc = "AI Github Copilot Dismiss" })
		map("i", "<C-;>", "<Plug>(copilot-accept-word)", { desc = "AI Github Copilot Accept Word" })
		map("i", "<C-]>", "<Plug>(copilot-accept-line)", { desc = "AI Github Copilot Accept Line" })
		map("i", "<C-p>", "<Plug>(copilot-suggest)", { desc = "AI Github Copilot Suggest" })
		map("i", "<C-.>", "<Plug>(copilot-suggest-line)", { desc = "AI Github Copilot Suggest Line" })
	end,
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
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	return {
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-x>"] = cmp.mapping.close(),
		-- ["<C-Space>"] = cmp.mapping.complete({}),
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
	local map = function(keys, func, desc)
		map("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end
	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	map("<leader>fsd", require("telescope.builtin").lsp_document_symbols, "[F]ind [S]ymbols in [D]ocument]")
	map("<leader>fsw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[F]ind [S]ymbols in [W]orkspace")
	map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename Variable")
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	map("<leader>cd", vim.diagnostic.goto_prev, "[C]ode Diagnostic [D]own")
	map("<leader>cu", vim.diagnostic.goto_next, "[C]ode Diagnostic [U]p")
	map("<leader>ce", vim.diagnostic.open_float, "[C]ode Diagnostic [E]rror messages")
	map("<leader>cq", vim.diagnostic.setloclist, "[C]ode Diagnostic [Q]uickfix list")
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
