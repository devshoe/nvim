return {
	{
		"ianding1/leetcode.vim",
		cmd = { "LeetCodeSignIn", "LeetCodeList", "LeetCodeSubmit", "LeetCodeTest" },
		config = function()
			vim.g.leetcode_browser = "chrome"
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			auto_fold = true,
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	event = "VeryLazy",
	-- 	ft = { "org" },
	-- 	config = function()
	-- 		-- Setup orgmode
	-- 		require("orgmode").setup({
	-- 			org_agenda_files = "~/orgfiles/**/*",
	-- 			org_default_notes_file = "~/orgfiles/refile.org",
	-- 		})
	--
	-- 		-- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
	-- 		-- add `org` to ignore_install
	-- 		-- require('nvim-treesitter.configs').setup({
	-- 		--   ensure_installed = 'all',
	-- 		--   ignore_install = { 'org' },
	-- 		-- })
	-- 	end,
	-- },
	{
		"folke/zen-mode.nvim",
		lazy = false,
	},

	{
		"anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			-- "anuvyklack/animation.nvim",
		},
		config = function()
			vim.o.winwidth = 150
			vim.o.winminwidth = 10
			-- vim.o.equalalways = false
			require("windows").setup({
				ignore = {
					buftype = { "quickfix", "nofile", "terminal" },
				},
			})
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
		},
	},
	{
		"monaqa/dial.nvim",
		keys = { --idk why not able to move this to mappings.lua, doesn't work
			{
				"<C-a>",
				function()
					return require("dial.map").inc_normal()
				end,
				expr = true,
				desc = "Increment",
			},
			{
				"<C-x>",
				function()
					return require("dial.map").dec_normal()
				end,
				expr = true,
				desc = "Decrement",
			},
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
					augend.constant.new({ elements = { "True", "False" } }),
				},
			})
		end,
	},
	{
		"theprimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
				save_on_toggle = false,

				-- saves the harpoon file upon every change. disabling is unrecommended.
				save_on_change = true,

				-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
				enter_on_sendcmd = false,

				-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
				tmux_autoclose_windows = false,

				-- filetypes that you want to prevent from adding to the harpoon list menu.
				excluded_filetypes = { "harpoon" },

				-- set marks specific to each git branch inside git repository
				mark_branch = false,

				-- enable tabline with harpoon marks
				tabline = false,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"tpope/vim-surround",
		lazy = false,
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
	},
}
-- {
-- 	"rmagatti/goto-preview",
-- 	config = function()
-- 		require("goto-preview").setup({
-- 			width = 120, -- Width of the floating window
-- 			height = 15, -- Height of the floating window
-- 			border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
-- 			default_mappings = false, -- Bind default mappings
-- 			debug = false, -- Print debug information
-- 			opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
-- 			resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
-- 			post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
-- 			post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
-- 			references = { -- Configure the telescope UI for slowing the references cycling window.
-- 				telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
-- 			},
-- 			-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
-- 			focus_on_open = true, -- Focus the floating window when opening it.
-- 			dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
-- 			force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
-- 			bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
-- 			stack_floating_preview_windows = true, -- Whether to nest floating windows
-- 			preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
-- 		})
-- 	end,
-- },
