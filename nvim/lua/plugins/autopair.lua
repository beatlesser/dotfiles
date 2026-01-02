-- AutoPair: automatically complete parens and brackets

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
local AutoPair = {
	"saghen/blink.pairs",
	event = "InsertEnter",
	version = "*", -- (recommended) only required with prebuilt binaries

	-- download prebuilt binaries from github releases
	dependencies = "saghen/blink.download",

	--- @module 'blink.pairs'
	--- @type blink.pairs.Config
	opts = {},
}
return AutoPair
