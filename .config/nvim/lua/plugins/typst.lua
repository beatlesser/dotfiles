return {
	"chomosuke/typst-preview.nvim",
	ft = "typst",
	keys = { { "<leader>tp", "<cmd>TypstPreviewToggle<cr>", desc = "toggle typst preview" } },
	version = "1.*",
	opts = {}, -- lazy.nvim will implicitly calls `setup {}`
}
