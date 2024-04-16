return {

	{
		"theprimeagen/harpoon",
		config = function()
			require("harpoon").setup({})
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

	{
		"tpope/vim-unimpaired",
		lazy = false,
	},
}
