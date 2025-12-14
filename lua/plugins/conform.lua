local formatters = {
	lua = { "stylua", lsp_format = "fallback" },
	javascript = { "prettierd", "prettier", stop_after_first = true },
	typescript = { "prettierd", "prettier", stop_after_first = true },
}

return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = formatters,
		formatters = {
			prettierd = {
				prepend_args = { "--single-quote" }
			}
		}
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ lsp_format = "fallback" })
			end,
			desc = "Code Format",
		},
	},
}
