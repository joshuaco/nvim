require("config.lazy")

vim.api.nvim_create_autocmd("VimLeave", {
	callback = function()
		vim.opt.guicursor = "a:ver25-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
	end,
})
