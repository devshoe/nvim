local M = {}

M.files = {
	-- Customization of shown content
	content = {
		-- Predicate for which file system entries to show
		filter = nil,
		-- What prefix to show to the left of file system entry
		prefix = nil,
		-- In which order to show file system entries
		sort = nil,
	},

	-- Module mappings created only inside explorer.
	-- Use `''` (empty string) to not create one.
	mappings = {
		close = "q",
		go_in = "l",
		go_in_plus = "<CR>",
		go_out = "h",
		go_out_plus = "H",
		reset = "<BS>",
		reveal_cwd = ".",
		show_help = "g?",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},

	-- General options
	options = {
		-- Whether to delete permanently or move into module-specific trash
		permanent_delete = true,
		-- Whether to use for editing directories
		use_as_default_explorer = true,
	},

	-- Customization of explorer windows
	windows = {
		-- Maximum number of windows to show side by side
		max_number = math.huge,
		-- Whether to show preview of file/directory under cursor
		preview = true,
		-- Width of focused window
		width_focus = 50,
		-- Width of non-focused window
		width_nofocus = 15,
		-- Width of preview window
		width_preview = 90,
	},
}

M.animate = {
	-- Cursor path
	cursor = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }),

		-- Path generator for visualized cursor movement
		--path = --<function: implements shortest line path>,
	},

	-- Vertical scroll
	scroll = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		--timing = --<function: implements linear total 250ms animation duration>,

		-- Subscroll generator based on total scroll
		--subscroll = --<function: implements equal scroll with at most 60 steps>,
	},

	-- Window resize
	resize = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		--timing = --<function: implements linear total 250ms animation duration>,

		-- Subresize generator for all steps of resize animations
		--subresize = --<function: implements equal linear steps>,
	},

	-- Window open
	open = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		-- timing = --<function: implements linear total 250ms animation duration>,

		-- Floating window config generator visualizing specific window
		-- winconfig = --<function: implements static window for 25 steps>,

		-- 'winblend' (window transparency) generator for floating window
		-- winblend = --<function: implements equal linear steps from 80 to 100>,
	},

	-- Window close
	close = {
		-- Whether to enable this animation
		enable = true,

		-- Timing of animation (how steps will progress in time)
		--timing = --<function: implements linear total 250ms animation duration>,

		-- Floating window config generator visualizing specific window
		--winconfig = --<function: implements static window for 25 steps>,

		-- 'winblend' (window transparency) generator for floating window
		--winblend = --<function: implements equal linear steps from 80 to 100>,
	},
}

M.comment = {
	-- Options which control module behavior
	options = {
		-- Function to compute custom 'commentstring' (optional)
		custom_commentstring = nil,

		-- Whether to ignore blank lines when commenting
		ignore_blank_line = false,

		-- Whether to recognize as comment only lines without indent
		start_of_line = false,

		-- Whether to force single space inner padding for comment parts
		pad_comment_parts = true,
	},

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = require("mappings").mini.comment(),

	-- Hook functions to be executed at certain stage of commenting
	hooks = {
		-- Before successful commenting. Does nothing by default.
		pre = function() end,
		-- After successful commenting. Does nothing by default.
		post = function() end,
	},
}

M.statusline = {
	use_icons = vim.g.have_nerd_font,
}

M.cursorword = {
	delay = 1,
}
return M
