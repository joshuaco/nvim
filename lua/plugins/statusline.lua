return {
	"nvim-mini/mini.statusline",
	version = false,
	opts = {},
	config = function()
		require("mini.statusline").setup()

		-- Customize only the Insert mode
		vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", {
			fg = "#1e1e2e", -- Dark Text
			bg = "#a6e3a1", -- Light Green Background
			bold = true,
		})
	end,
}
