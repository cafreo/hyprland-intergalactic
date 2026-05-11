return {
    "HampusHauffman/block.nvim",
    config = function()
        require("block").setup({
			bg = "#201c28",
			colors = {
				"#201c28",
				"#700000",
				"#506000",
			},
		})
    end
}
