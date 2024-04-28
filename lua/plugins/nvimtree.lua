local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "h", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	config = function()
	-- 		require("nvim-tree").setup({
	-- 			on_attach = on_attach,
	-- 			auto_close = true,
	-- 			update_focused_file = {
	-- 				enable = true,
	-- 			},
	--
	-- 			view = {
	-- 				width = 30,
	-- 				side = "left",
	-- 				auto_resize = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
