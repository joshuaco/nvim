return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-mini/mini.icons" },
	config = function()
		require("fzf-lua").setup({})
		-- require("fzf-lua").register_ui_select()
	end,
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files in Project Directory",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find by Grepping in Project Directory",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find active Buffers",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "Find Builtin Fzf",
		},
	},
}
