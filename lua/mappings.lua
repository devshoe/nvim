require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

-- Change behaviour of default NVChad buffer switching
vim.api.nvim_del_keymap("n", "<Tab>")
vim.api.nvim_del_keymap("n", "<S-Tab>")
map("n", "<leader><tab>", function()
	require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<leader><S-tab>", function()
	require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

--Utility Mappings
map(
	"n",
	"<leader>c$",
	"<cmd>set autochdir<CR><cmd>set noautochdir<CR>",
	{ desc = "Set working dir to folder of current buffer" }
)
map("n", "<leader>c_", "<cmd>cd ..<CR>", { desc = "Set working dir to one above" })
map("n", "<C-d>", "<C-d>zz", { desc = "Down half page" })
map("n", "<C-u>", "<C-u>zz", { desc = "Up half page" })

--change behaviour of yanking
map({"n", "v"}, "d", '"_d', {desc = "Delete [no yank] <Motion>"})
map({"n", "v"}, "c", '"_c', {desc = "Change [no yank] <Motion>"})
--Telescope add ons
map(
	"n",
	"<leader>fs",
	"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
	{ desc = "Search for symbols in current workspace" }
)
map("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Search for symbols in current document" })
map({ "v" }, "<leader>fw", '"zy<cmd>Telescope grep_string default_text=<C-r>z<cr>', { desc = "Search for selection" })
map("n", "<leader>fe", "<cmd>Telescope file_browser<CR>", { desc = "Telescope File Explorer" })
-- Sessions
map("n", "<leader>sf", "<cmd>SearchSession<CR>", { desc = "Session Find" })
map("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Session Save" })

--AI Tools
map("n", "<leader>acc", "<cmd>ChatGPT<CR>", { desc = "AI ChatGPT Full Chat" })
map({ "n", "v" }, "<leader>aci", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "ChatGPT Edit With Instructions" })
map({ "n", "v" }, "<leader>acg", "<cmd>ChatGPTRun grammar_correction<CR>", { desc = "ChatGPT: Correct Grammar" })
-- map({"n","v"},"<leader>act","<cmd>ChatGPTRun translate<CR>",{desc = "ChatGPT"})
map({ "n", "v" }, "<leader>ack", "<cmd>ChatGPTRun keywords<CR>", { desc = "ChatGPT: Extract Keywords" })
map({ "n", "v" }, "<leader>K", "<cmd>ChatGPTRun docstring<CR>", { desc = "ChatGPT: Generate Docs" })
map({ "n", "v" }, "<leader>act", "<cmd>ChatGPTRun add_tests<CR>", { desc = "ChatGPT: Add Tests" })
map({ "n", "v" }, "<leader>aco", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "ChatGPT: Optimize Code" })
map({ "n", "v" }, "<leader>acs", "<cmd>ChatGPTRun summarize<CR>", { desc = "ChatGPT: Summarize" })
map({ "n", "v" }, "<leader>acf", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "ChatGPT: Fix Bugs" })
map({ "n", "v" }, "<leader>ace", "<cmd>ChatGPTRun explain_code<CR>", { desc = "ChatGPT: Explain" })
map({ "n", "v" }, "<leader>acx", "<cmd>ChatGPTRun roxygen_edit<CR>", { desc = "ChatGPT: Roxygen Edit" })
map(
	{ "n", "v" },
	"<leader>aca",
	"<cmd>ChatGPTRun code_readability_analysis<CR>",
	{ desc = "ChatGPT: Code Readability Analysis" }
)
map("n", "<leader>ag", function()
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
end, { desc = "AI Github Copilot Toggle" })

--Database/ Dadbod
map("n", "<leader>dbo", "<cmd>DBUI<CR>", { desc = "Open DB UI" })
map("n", "<leader>dba", "<cmd>DBUIAddConnection<CR>", { desc = "Add DB Connection" })
map("n", "<leader>dbf", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB Open Buffers" })
map("n", "<leader>dbx", "<cmd>DBUIClose<CR>", { desc = "Close DB Buffers" })

-- Disable arrow keys in normal and visual mode
map({ "n", "v" }, "<Up>", "<Nop>", { noremap = true })
map({ "n", "v" }, "<Down>", "<Nop>", { noremap = true })
map({ "n", "v" }, "<Left>", "<Nop>", { noremap = true })
map({ "n", "v" }, "<Right>", "<Nop>", { noremap = true })

map({"n","v"}, "<C-n>", function ()
  require("mini.files").open()
end)
--nvchad term bindings
map({ "n", "t" }, "<leader>tv", function()
	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm", size = 0.3 })
end, { desc = "Terminal Toggleable vertical term" })

map({ "n", "t" }, "<leader>tt", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm", size = 0.3 })
end, { desc = "Terminal New horizontal term" })

map({ "n", "t" }, "<leader>tf", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle Floating term" })

map("t", "<esc>", [[<C-\><C-n>]])

--DBUI
vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function()
		local function map(mode, lhs, rhs, opts)
			local bufnr = vim.api.nvim_get_current_buf()
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
		end

		map("n", "<leader>dbr", "<Plug>(DBUI_ExecuteQuery)", { desc = "Execute current file" })
		map("v", "<leader>dbr", "<Plug>(DBUI_ExecuteQuery)", { desc = "Execute current selection" })
		map("n", "<leader>dbs", "<Plug>(DBUI_SaveQuery)", { desc = "Save Current Query" })
	end,
})
