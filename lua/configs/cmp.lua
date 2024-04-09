local M = {}

M.luasnip = {}

M.cmp = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	luasnip.config.setup(M.luasnip)

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		completion = { completeopt = "menu,menuone,noinsert" },
		mapping = require("mappings").cmp(cmp, luasnip),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
		},
	})
end

return M
