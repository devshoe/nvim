require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Change behaviour of default NVChad tab switching
vim.api.nvim_del_keymap('n','<Tab>')
vim.api.nvim_del_keymap('n', '<S-Tab>')
map("n", "<leader><tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<leader><S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

--Utility Mappings
map("n", "<leader>c$", "<cmd>set autochdir<CR><cmd>set noautochdir<CR>", {desc = "Set working dir to folder of current buffer"})
map("n", "<leader>c_", "<cmd>cd ..<CR>", { desc = "Set working dir to one above"})
map("n", "<C-d>", "<C-d>zz", {desc = "Down half page"})
map("n", "<C-u>", "<C-u>zz", {desc = "Up half page"})

--Telescope add ons
map("n", "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", {desc = "Search for symbols in current workspace"})
map("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<CR>", {desc = "Search for symbols in current document"})
map("v", "<leader>fw", '"zy:Telescope grep_string default_text=<C-r>z<cr>')

-- Sessions
map('n', '<leader>sf', '<cmd>SearchSession<CR>',{desc = "Session Find"})
map('n', '<leader>ss', '<cmd>SessionSave<CR>', {desc = "Session Save"})

--AI Tools
map("n", "<leader>ac", "<cmd>ChatGPT<CR>", {desc = "AI ChatGPT"})
map("n", "<leader>ag", function ()
   local status = vim.fn.execute('Copilot status')
   if string.find(status, "Ready") then
        -- If Copilot is ready, disable it
        vim.cmd('Copilot disable')
        print('Copilot disabled')
    else
        -- If Copilot is not ready, enable it
        vim.cmd('Copilot enable')
        print('Copilot enabled')
    end
end, {desc = "AI Github Copilot Toggle"})

--Database/ Dadbod
map("n", "<leader>dbo", "<cmd>DBUI<CR>", {desc = "Open DB UI"})
map("n", "<leader>dba", "<cmd>DBUIAddConnection<CR>", {desc = "Add DB Connection"})
map("n", "<leader>dbf", "<cmd>DBUIFindBuffer<CR>", {desc = "Find DB Open Buffers"})
map("n", "<leader>dbx", "<cmd>DBUIClose<CR>", {desc = "Close DB Buffers"})

-- Disable arrow keys in normal and visual mode
map({'n','v'}, '<Up>', '<Nop>', {noremap = true})
map({'n','v'}, '<Down>', '<Nop>', {noremap = true})
map({'n','v'}, '<Left>', '<Nop>', {noremap = true})
map({'n','v'}, '<Right>', '<Nop>', {noremap = true})

--nvchad term bindings
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
end, { desc = "Terminal Toggleable vertical term" })

map({ "n", "t" }, "<C-`>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

--Toggle Term bindings
map('t', '<esc>', [[<C-\><C-n>]])
map('t', 'jk', [[<C-\><C-n>]])
map('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
map('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
map('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
map('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
map('t', '<C-w>', [[<C-\><C-n><C-w>]])
