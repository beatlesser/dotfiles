local utils = require("heirline.utils")
local palette = require("catppuccin.palettes").get_palette("mocha")

local FileIcon = {
	condition = function(self)
		return vim.fn.fnamemodify(self.filename, ":.") ~= ""
	end,
	init = function(self)
		self.is_modified = vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		local icon, hl, _ = MiniIcons.get("file", "file." .. extension)
		local bt = vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) or nil
		if bt and bt == "terminal" then
			icon = ""
		end
		self.icon = icon
		self.icon_color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl })["fg"])
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.is_modified and self.icon_color }
	end,
}
-- we redefine the filename component, as we probably only want the tail and not the relative path
local FileName = {
	init = function(self)
		self.is_modified = vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ":e")
		local _, hl, _ = MiniIcons.get("file", "file." .. extension)
		self.icon_color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl })["fg"])
	end,
	provider = function(self)
		-- self.filename will be defined later, just keep looking at the example!
		local filename = self.filename
		filename = filename == "" and vim.bo.filetype or vim.fn.fnamemodify(filename, ":t")
		return "" .. filename .. ""
	end,
	hl = function(self)
		return {
			-- fg = self.is_modified and palette.yellow or palette.surface2,
			fg = self.is_modified and self.icon_color,
			italic = self.is_modified,
		}
	end,
}

local FileFlags = {
	{
		init = function(self)
			local filename = self.filename
			local extension = vim.fn.fnamemodify(filename, ":e")
			local _, hl, _ = MiniIcons.get("file", "file." .. extension)
			self.icon_color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = hl })["fg"])
		end,
		condition = function(self)
			local ignored_filetypes = {
				"dap-repl",
			}
			local result = vim.fn.fnamemodify(self.filename, ":.") ~= ""
				and vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
			local ft = vim.api.nvim_get_option_value("buftype", { buf = self.bufnr })
			if vim.tbl_contains(ignored_filetypes, ft) then
				result = false
			end
			return result
		end,
		provider = "  ",
		hl = function(self)
			return { fg = self.icon_color, bold = self.is_active }
		end,
	},
	{
		condition = function(self)
			return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
				or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
		end,
		provider = function(self)
			if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
				return ""
			else
				return " 󰈡 "
			end
		end,
		hl = { fg = palette.text },
	},
}

local FileNameBlock = {
	init = function(self)
		local bufnr = self.bufnr or 0
		self.filename = vim.api.nvim_buf_get_name(bufnr)
	end,
	hl = { fg = palette.text },
	FileIcon,
	FileName,
	FileFlags,
}

local TablineFileNameBlock = vim.tbl_extend("force", FileNameBlock, {
	on_click = {
		callback = function(_, minwid, _, button)
			if button == "m" then -- close on mouse middle click
				vim.schedule(function()
					vim.api.nvim_buf_delete(minwid, { force = false })
				end)
			else
				vim.api.nvim_win_set_buf(0, minwid)
			end
		end,
		minwid = function(self)
			return self.bufnr
		end,
		name = "heirline_tabline_buffer_callback",
	},
})
-- a nice "x" button to close the buffer
local TablineCloseButton = {
	condition = function(self)
		return not vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
	end,
	{ provider = " " },
	{
		provider = "✗",
		hl = function(self)
			return {
				fg = self.is_active and palette.text or palette.surface2,
				bold = self.is_active or self.is_visible,
				italic = self.is_active,
			}
		end,
		on_click = {
			callback = function(_, minwid)
				vim.schedule(function()
					vim.api.nvim_buf_delete(minwid, { force = false })
					vim.cmd.redrawtabline()
				end)
			end,
			minwid = function(self)
				return self.bufnr
			end,
			name = "heirline_tabline_close_buffer_callback",
		},
	},
}

-- The final touch!
local TablineBufferLeftIndicator = {
	provider = "┃ ",
	hl = function(self)
		if self.is_active then
			return { fg = palette.yellow, bold = true }
		else
			return { fg = palette.surface2, bold = false }
		end
	end,
}

local TablineBufferBlock = { TablineBufferLeftIndicator, TablineFileNameBlock, TablineCloseButton }

-- and here we go
local BufferLine = utils.make_buflist(
	TablineBufferBlock,
	{ provider = " ", hl = { fg = "gray" } }, -- left truncation, optional (defaults to "<")
	{ provider = " ", hl = { fg = "gray" } } -- right trunctation, also optional (defaults to ...... yep, ">")
	-- by the way, open a lot of buffers and try clicking them ;)
)

-- this is the default function used to retrieve buffers
local get_bufs = function()
	return vim.tbl_filter(function(bufnr)
		return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
	end, vim.api.nvim_list_bufs())
end

-- initialize the buflist cache
local buflist_cache = {}

-- setup an autocmd that updates the buflist_cache every time that buffers are added/removed
vim.api.nvim_create_autocmd({ "UIEnter", "BufAdd", "BufDelete" }, {
	callback = function()
		vim.schedule(function()
			local buffers = get_bufs()
			for i, v in ipairs(buffers) do
				buflist_cache[i] = v
			end
			for i = #buffers + 1, #buflist_cache do
				buflist_cache[i] = nil
			end

			-- check how many buffers we have and set showtabline accordingly
			if #buflist_cache > 1 then
				vim.o.showtabline = 2 -- always
			elseif vim.o.showtabline ~= 1 then -- don't reset the option if it's already at default value
				vim.o.showtabline = 1 -- only when #tabpages > 1
			end
		end)
	end,
})

local TabLineOffset = {
	condition = function(self)
		local win = vim.api.nvim_tabpage_list_wins(0)[1]
		local bufnr = vim.api.nvim_win_get_buf(win)
		self.winid = win

		if vim.bo[bufnr].filetype == "neo-tree" then
			self.title = ""
			self.hl = { bg = palette.base }
			return true
			-- elseif vim.bo[bufnr].filetype == "TagBar" then
			--     ...
		end
	end,

	provider = function(self)
		local title = self.title
		local width = vim.api.nvim_win_get_width(self.winid)
		local pad = math.ceil((width - #title) / 2)
		return string.rep(" ", pad) .. title .. string.rep(" ", pad)
	end,

	hl = function(self)
		if vim.api.nvim_get_current_win() == self.winid then
			return "TablineSel"
		else
			return "Tabline"
		end
	end,
}

local Tabpage = {
	provider = function(self)
		return "%" .. self.tabnr .. "T " .. self.tabpage .. " %T"
	end,
	hl = function(self)
		if not self.is_active then
			return "TabLine"
		else
			return "TabLineSel"
		end
	end,
}

local TabpageClose = {
	provider = "%999X ✗ %X",
	hl = "TabLine",
}

local TabPages = {
	condition = function()
		return #vim.api.nvim_list_tabpages() >= 2
	end,
	{ provider = "%=" },
	utils.make_tablist(Tabpage),
	TabpageClose,
}

return { TabLineOffset, BufferLine, TabPages }
