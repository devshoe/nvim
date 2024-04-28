return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
		config = require("configs.lsp").lsp_config,
	},

	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			local opts = require("configs.lsp").lsp_signature
			require("lsp_signature").setup(opts)
		end,
	},

	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
				--
				outline_window = {
					auto_jump = true,
					width = 20,
					show_numbers = true,
				},

				keymaps = {
					up_and_jump = "<C-p>",
					down_and_jump = "<C-n>",
				},
			})
		end,
	},
}
