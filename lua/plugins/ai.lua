return {
	{
		"ilan-schemoul/ChatGPT.nvim",
		branch = "fix-invalid-capture",
		event = "VeryLazy",
		config = function()
			local opts = require("configs.chatgpt")
			require("chatgpt").setup(opts)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.cmd("Copilot disable")
		end,
	},
}
