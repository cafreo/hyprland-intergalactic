return {
	'Pocco81/auto-save.nvim',
	enabled = true,
	config = function()
  	require('auto-save').setup ({
		execution_message = {
			message = function()
				return ("󰠘 autosave completed")
			end,
			cleaning_inverval = 3000,
		},
	trigger_events = {"InsertLeave", "TextChanged"},
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")
		if
			fn.getbufvar(buf, "&modifiable") == 1 and
			utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
			end
			return false -- can't save
		end,

	write_all_buffers = false,
	})
	end,
}
