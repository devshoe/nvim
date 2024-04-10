return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").register({
			["<leader>a"] = { name = "[A]I Tools", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[T]erminal/[T]mux Actions", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[S]ession Management", _ = "which_key_ignore" },
			["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
			["<leader>d"] = { name = "[D]ocuments", _ = "which_key_ignore" },
			["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
		})
	end,
}
