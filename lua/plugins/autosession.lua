return {
	{
		"rmagatti/auto-session",
		cmd = { "SessionSave" },
		config = function(opts)
			local opts = require("configs.autosession")
			require("auto-session").setup(opts)
		end,
	},
	{
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		cmd = { "SearchSession" },
		config = function()
			require("session-lens").setup({
				path_display = { "shorten" },
				theme = "ivy", -- default is dropdown
				theme_conf = { border = false },
				previewer = true,
			})
		end,
	},
}
