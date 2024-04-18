vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.cmdheight = 0
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.linebreak = true
vim.opt.wrap = false
-- Keep signcolumn on by default

-- vim.opt.signcolumn = "yes"
vim.opt.numberwidth = 2
-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

vim.g.tmux_navigator_save_on_switch = 2

-- local set_winsize = function()
-- 	print("Setting win size: total height - " .. vim.o.lines .. " total width - " .. vim.o.columns)
-- 	vim.opt.winheight = math.floor(vim.o.lines * 0.3)
-- 	vim.opt.winwidth = math.floor(vim.o.columns * 0.3)
-- end
--
-- vim.api.nvim_create_autocmd("BufCreate", {
-- 	pattern = "*",
-- 	callback = function()
-- 		set_winsize()
-- 	end,
-- })
