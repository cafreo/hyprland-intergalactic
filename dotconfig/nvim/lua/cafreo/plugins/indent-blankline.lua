return {
	'lukas-reineke/indent-blankline.nvim',
	event = "WinEnter",
	config = function()
    	require('ibl').setup ({
		scope = {
			show_start = false,
		},
	})
end,
}


