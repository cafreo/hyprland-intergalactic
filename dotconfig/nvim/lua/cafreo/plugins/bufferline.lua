return {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
	require('bufferline').setup ({
		options = {
			mode = "buffers",
			style_preset = {
				require('bufferline').style_preset.no_italic,
				require('bufferline').style_preset.no_bold,
			},
			numbers = "ordinal",
			close_command = "bdelete! %d",
			left_mouse_command = "buffer %d",
			right_mouse_command = "bdelete %d",
			middle_mouse_command = nil,
			indicator = {
				icon = '┃',
				style = "icon",
			},
			buffer_close_icon = "",
			modified_icon = "*",
			name_formatter = function(name, bufnr)
			end,
			max_name_length = 18,
			tab_size = 18,
			color_icons = true,
			get_element_icon = function (element)
				local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = true })
				return icon, hl
			end,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			separator_style = {''},
			always_show_bufferline = true,
			hover = {
				enabled = true,
				delay = 200,
			},
			sort_by = "insert_after_current",
			--groups = {
			--	items {
			--		require('bufferline.groups').builtin.pinned:with({ icon = "" })
			--	}
			--}
		}	
	})
end,
}
