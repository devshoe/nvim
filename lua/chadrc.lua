-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}


M.ui = {
	theme = "blossom_light",

	hl_override = {
		Comment = { bold = true },
		["@comment"] = { bold = true },
	},
}

return M
