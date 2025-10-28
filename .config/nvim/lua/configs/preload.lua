-- This file contains settings load before initializing lazy
local Preload = {}

function Preload.apply()
	-- set global leader
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "
	-- has nerd font or not
	vim.g.have_nerd_font = true

	-- WARN: put this line here instead of `options.lua`
	-- prevents line number and cursor line appear on
	-- dashboard, so werid.
	vim.opt.laststatus = 2
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.cursorline = true
end

return Preload
