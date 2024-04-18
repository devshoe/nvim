local M = {}

M.luasnip = {}

M.cmp = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	luasnip.config.setup(M.luasnip)
	cmp.setup({
		experimental = {
			ghost_text = true,
		},
		sorting = {
			priority_weight = 10,
			comparators = {

				-- require("cmp_copilot.comparators").prioritize,
				-- Below is the default comparitor list and order for nvim-cmp
				cmp.config.compare.offset,
				-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
		---@diagnostic disable-next-line: missing-fields
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol",
				max_width = 50,
				symbol_map = { Copilot = "" },
			}),
		},
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		completion = {
			-- keyword_length = 0,

			-- keyword_pattern = " ",
			completeopt = "menu,menuone,noinsert,noselect",
		},
		mapping = require("mappings").cmp(),
		sources = {
			{ name = "copilot", group_index = 2 },
			{ name = "nvim_lsp", group_index = 2 },
			{ name = "luasnip", group_index = 2 },
			{ name = "path", group_index = 2 },
			{ name = "vim-dadbod-completion", group_index = 2 },
		},
	})
end

return M
