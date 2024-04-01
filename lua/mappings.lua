require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

vim.api.nvim_del_keymap('n','<Tab>')
vim.api.nvim_del_keymap('n', '<S-Tab>')


map("n", "<leader><tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<leader><S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

map("n", "<leader>c$", "<cmd>set autochdir<CR><cmd>set noautochdir<CR>", {desc = "Set working dir to folder of current buffer"})
map("n", "<leader>c_", "<cmd>cd ..<CR>", { desc = "Set working dir to one above"})

map("n", "<C-d>", "<C-d>zz", {desc = "Down half page"})
map("n", "<C-u>", "<C-u>zz", {desc = "Up half page"})

map("n", "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", {desc = "Search for symbols in current workspace"})
map("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<CR>", {desc = "Search for symbols in current document"})


map("n", "<leader>co", "<cmd>ChatGPT<CR>", {desc = "Open ChatGPT"})
map("n", "<leader>cx", function ()
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
end, {desc = "Toggle Github Copilot"})

