vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons", version = vim.version.range("*") },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", version = vim.version.range("*") },
})

require("mini.icons").setup()
require("nvim-web-devicons").setup()
