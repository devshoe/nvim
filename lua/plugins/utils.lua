return {

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
