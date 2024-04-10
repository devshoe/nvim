require("lazy-bootstrap")
require("options")
-- [[ Configure and install plugins ]]

--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({ { import = "plugins" } })

vim.schedule(function()
	local mappings = require("mappings")
	mappings.page_navigation()
	mappings.window_navigation()
	mappings.buffer_navigation()
	mappings.terminal()
	mappings.telescope()
	mappings.mini.files()
	mappings.sessions()
	mappings.ai.chatgpt()
	mappings.ai.copilot()
	mappings.dadbod()
	mappings.language_specific.go()
	require("autocmds")
end)
