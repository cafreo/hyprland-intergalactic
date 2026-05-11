return {
	'lukas-reineke/indent-blankline.nvim',
	config = function()

        local highlight = {
            "Comment",
        }
    	require('ibl').setup {
            indent = { highlight = highlight },
            scope = { enabled = false },
        }
end,
}
