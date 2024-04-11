local opts = require("configs.ai")
return {
	{
		"ilan-schemoul/ChatGPT.nvim",
		branch = "fix-invalid-capture",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup(opts.chatgpt)
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
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatExplain",
			"CopilotChatTests",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatFixDiagnostic",
			"CopilotChatCommit",
			"CopilotChatCommitStaged",
		},
		dependencies = {
			{ "github/copilot.vim" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		config = function()
			require("CopilotChat").setup(opts.copilot())
		end,
	},
}
