return {
	"nvim-lualine/lualine.nvim",
	dependencies = {"nvim-tree/nvim-web-devicons"},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			white = '#C8CACC',
			blackog = '#1F1B27',
			black = '#292531',
			red = '#CB2010',
			red2 = '#cb103f',
			red3 = '#cb105e',
			green = '#96D61F',
			green3 = '#d69c1f',
			green2 = '#d6bb1f',
			blue = '#1F74D6',
			blue3 = '#12b9e2',
			blue2 = '#1f93d6',
			yellow = '#EFAF39',
			yellow2 = '#ef7339',
			yellow3 = '#ef5439',
			violet = '#D21ECF',
			violet2 = '#991ed2',
			violet3 = '#7b1ed2',
			orange = '#E65E19',

			inactive_bg = '#201c28',
		}

		local intergalactic = {
			normal = {
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
				x = { bg = colors.yellow3, fg = colors.black },
				y = { bg = colors.yellow2, fg = colors.black },
				z = { bg = colors.yellow, fg = colors.black, gui = "bold" },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
				x = { bg = colors.green3, fg = colors.black },
				y = { bg = colors.green2, fg = colors.black },
				z = { bg = colors.green, fg = colors.black, gui = "bold" },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.white, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
				x = { bg = colors.violet3, fg = colors.white },
				y = { bg = colors.violet2, fg = colors.white },
				z = { bg = colors.violet, fg = colors.white, gui = "bold" },
			},
			command = {
				a = { bg = colors.blue, fg = colors.white, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
				x = { bg = colors.blue3, fg = colors.white },
				y = { bg = colors.blue2, fg = colors.white },
				z = { bg = colors.blue, fg = colors.white, gui = "bold" },
			},
			replace = {
				a = { bg = colors.red, fg = colors.white, gui = "bold" },
				b = { bg = colors.black, fg = colors.white },
				c = { bg = colors.black, fg = colors.white },
				x = { bg = colors.red3, fg = colors.white },
				y = { bg = colors.red2, fg = colors.white },
				z = { bg = colors.red, fg = colors.white, gui = "bold" },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
				x = { bg = colors.inactive_bg, fg = colors.semilightgray },
				y = { bg = colors.inactive_bg, fg = colors.semilightgray },
				z = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
			},
		}

		local custom_fname = require('lualine.components.filename'):extend()
		local highlight = require'lualine.highlight'
		local default_status_colors = { saved = colors.fg, modified = colors.yellow }

		function custom_fname:init(options)
			custom_fname.super.init(self, options)
			self.status_colors = {
				saved = highlight.create_component_highlight_group(
				{fg = default_status_colors.saved}, 'filename_status_saved', self.options),
				modified = highlight.create_component_highlight_group(
				{fg = default_status_colors.modified}, 'filename_status_modified', self.options),
			}
			if self.options.color == nil then self.options.color = '' end
		end

		function custom_fname:update_status()
			local data = custom_fname.super.update_status(self)
			data = highlight.component_format_highlight(vim.bo.modified
			and self.status_colors.modified
			or self.status_colors.saved) .. data
			return data
		end
		require('lualine').setup{
			options = {
				icons_enabled = true,
				theme = intergalactic,
			},

			sections = {
				lualine_a = {
					{
						'mode',
						separator = { left = '', right = ''},
						icons_enabled = true,
					},
				},

				lualine_b = {
					{
						custom_fname,
						path = 3,
						symbols = {
							modified = '[*]',
							readonly = '[x]',
							unnamed = '[-]',
							newfile = '[+]',
						},
					}
				},

				lualine_c = {
						
				},

				lualine_x = {
						{
						'branch', 'diff', 'diagnostics',

						colored = true,
						symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H', added = '+', modified = '~', removed = '-'},
						separator = { left = '', right = ''},
						sources = { 'nvim_diagnostic', 'coc' },

						-- Displays diagnostics for the defined severity types
						sections = { 'error', 'warn', 'info', 'hint' },

						diagnostics_color = {
							-- Same values as the general color option can be used here.
							error = 'DiagnosticError', -- Changes diagnostics' error color.
							warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
							info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
							hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
						},

						diff_color = {
							-- Same color values as the general color option can be used here.
							added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
							modified = 'LuaLineDiffChange', -- Changes the diff's modified color
							removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
						},
						-- Displays diagnostics status in color if set to true.
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false,   -- Show diagnostics even if there are none.
					},

				},

				lualine_y = {
					{
						'filetype', 'searchcount',
						colored = false,
						icon_only = true,
						padding = { left = 1, right = 1},
						separator = { left = '', right = ''},
					},

				},

				lualine_z = {
					{
						'location',
						separator = { left = '', right = ''},
					},
				},

				--        lualine_x = {
					--          {
						--           lazy_status.updates,
						--            cond = lazy_status.has_updates,
						--	    { 'mode', separator = { left = '' }, right_padding = 2 },
						--          },

						--	  { "branch" },
						--	  { "buffers" },
						--	  { "diagnostics" },
						--	  { "fileformat" },
						--       },
					},
				}
			end,
		}
