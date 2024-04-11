local M = {}
M.chatgpt = {
	api_key_cmd = nil,
	yank_register = "+",
	edit_with_instructions = {
		diff = false,
		keymaps = {
			close = "<C-c>",
			accept = "<C-y>",
			toggle_diff = "<C-d>",
			toggle_settings = "<C-o>",
			toggle_help = "<C-h>",
			cycle_windows = "<Tab>",
			use_output_as_input = "<C-i>",
		},
	},
	chat = {
		welcome_message = WELCOME_MESSAGE,
		loading_text = "Loading, please wait ...",
		question_sign = "", -- 🙂
		answer_sign = "ﮧ", -- 🤖
		border_left_sign = "",
		border_right_sign = "",
		max_line_length = 120,
		sessions_window = {
			active_sign = "  ",
			inactive_sign = "  ",
			current_line_sign = "",
			border = {
				style = "rounded",
				text = {
					top = " Sessions ",
				},
			},
			win_options = {
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
			},
		},
		keymaps = {
			close = "<C-q>",
			yank_last = "<C-y>",
			yank_last_code = "<C-k>",
			scroll_up = "<C-u>",
			scroll_down = "<C-d>",
			new_session = "<C-n>",
			cycle_windows = "<Tab>",
			cycle_modes = "<C-f>",
			next_message = "<C-j>",
			prev_message = "<C-k>",
			select_session = "<CR>",
			rename_session = "r",
			delete_session = "d",
			draft_message = "<C-/>",
			edit_message = "e",
			delete_message = "d",
			toggle_settings = "<C-o>",
			toggle_sessions = "<C-p>",
			toggle_help = "<C-h>",
			toggle_message_role = "<C-r>",
			toggle_system_role_open = "<C-s>",
			stop_generating = "<C-x>",
		},
	},
	popup_layout = {
		default = "center",
		center = {
			width = "80%",
			height = "80%",
		},
		right = {
			width = "30%",
			width_settings_open = "50%",
		},
	},
	popup_window = {
		border = {
			highlight = "FloatBorder",
			style = "rounded",
			text = {
				top = " ChatGPT ",
			},
		},
		win_options = {
			wrap = true,
			linebreak = true,
			foldcolumn = "1",
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
		buf_options = {
			filetype = "markdown",
		},
	},
	system_window = {
		border = {
			highlight = "FloatBorder",
			style = "rounded",
			text = {
				top = " SYSTEM ",
			},
		},
		win_options = {
			wrap = true,
			linebreak = true,
			foldcolumn = "2",
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	popup_input = {
		prompt = "  ",
		border = {
			highlight = "FloatBorder",
			style = "rounded",
			text = {
				top_align = "center",
				top = " Prompt ",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
		submit = "<C-Enter>",
		submit_n = "<Enter>",
		max_visible_lines = 20,
	},
	settings_window = {
		setting_sign = "  ",
		border = {
			style = "rounded",
			text = {
				top = " Settings ",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	help_window = {
		setting_sign = "  ",
		border = {
			style = "rounded",
			text = {
				top = " Help ",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
		},
	},
	openai_params = {
		model = "gpt-4-0125-preview",
		frequency_penalty = 0,
		presence_penalty = 0,
		max_tokens = 4096,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
	openai_edit_params = {
		model = "gpt-4-0125-preview",
		frequency_penalty = 0,
		presence_penalty = 0,
		temperature = 0,
		top_p = 1,
		n = 1,
	},
	use_openai_functions_for_edits = false,
	actions_paths = {},
	show_quickfixes_cmd = "Trouble quickfix",
	predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
	highlights = {
		help_key = "@symbol",
		help_description = "@comment",
	},
}

M.copilot = function()
	local prompts = require("CopilotChat.prompts")
	local select = require("CopilotChat.select")
	return {
		debug = false, -- Enable debug logging
		proxy = nil, -- [protocol://]host[:port] Use this proxy
		allow_insecure = false, -- Allow insecure server connections

		system_prompt = prompts.COPILOT_INSTRUCTIONS, -- System prompt to use
		model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
		temperature = 0.1, -- GPT temperature

		question_header = "## User ", -- Header to use for user questions
		answer_header = "## Copilot ", -- Header to use for AI answers
		error_header = "## Error ", -- Header to use for errors
		separator = "---", -- Separator to use in chat

		show_folds = true, -- Shows folds for sections in chat
		show_help = false, -- Shows help message as virtual lines when waiting for user input
		auto_follow_cursor = true, -- Auto-follow cursor in chat
		auto_insert_mode = false, -- Automatically enter insert mode when opening window and if auto follow cursor is enabled on new prompt
		clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

		context = "buffers", -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
		history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
		callback = nil, -- Callback to use when ask response is received

		-- default selection (visual or line)
		selection = function(source)
			return select.visual(source) or select.line(source)
		end,

		-- default prompts
		prompts = {
			Explain = {
				prompt = "/COPILOT_EXPLAIN Write an explanation for the code above as paragraphs of text.",
			},
			Tests = {
				prompt = "/COPILOT_TESTS Write a set of detailed unit test functions for the code above.",
			},
			Fix = {
				prompt = "/COPILOT_FIX There is a problem in this code. Rewrite the code to show it with the bug fixed.",
			},
			Optimize = {
				prompt = "/COPILOT_REFACTOR Optimize the selected code to improve performance and readablilty.",
			},
			Docs = {
				prompt = "/COPILOT_REFACTOR Write documentation for the selected code. The reply should be a codeblock containing the original code with the documentation added as comments. Use the most appropriate documentation style for the programming language used (e.g. JSDoc for JavaScript, docstrings for Python etc.",
			},
			FixDiagnostic = {
				prompt = "Please assist with the following diagnostic issue in file:",
				selection = select.diagnostics,
			},
			Commit = {
				prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
				selection = select.gitdiff,
			},
			CommitStaged = {
				prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
				selection = function(source)
					return select.gitdiff(source, true)
				end,
			},
		},

		-- default window options
		window = {
			layout = "vertical", -- 'vertical', 'horizontal', 'float'
			-- Options below only apply to floating windows
			relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
			border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
			width = 0.5, -- fractional width of parent
			height = 0.6, -- fractional height of parent
			row = nil, -- row position of the window, default is centered
			col = nil, -- column position of the window, default is centered
			title = "Copilot Chat", -- title of chat window
			footer = nil, -- footer of chat window
			zindex = 1, -- determines if window is on top or below other floating windows
		},

		-- default mappings
		mappings = {
			complete = {
				detail = "Use @<Tab> or /<Tab> for options.",
				insert = "<Tab>",
			},
			close = {
				normal = "q",
				insert = "<C-c>",
			},
			reset = {
				normal = "<C-l>",
				insert = "<C-l>",
			},
			submit_prompt = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			accept_diff = {
				normal = "<C-y>",
				insert = "<C-y>",
			},
			yank_diff = {
				normal = "gy",
			},
			show_diff = {
				normal = "gd",
			},
			show_system_prompt = {
				normal = "gp",
			},
			show_user_selection = {
				normal = "gs",
			},
		},
	}
end

return M
