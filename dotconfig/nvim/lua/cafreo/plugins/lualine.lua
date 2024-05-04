return {
  "nvim-lualine/lualine.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
	  local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      white = '#C8CACC',
      blackog = '#201c28',
      black = '#2a2632',
      red = '#D12411',
      green = '#94D026',
      blue = '#2677D1',
      yellow = '#F5B73B',
      violet = '#C727C4',
      orange = '#E57D29',

      inactive_bg = '#201c28',
    }

    local intergalactic = {
      normal = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
        x = { bg = colors.orange, fg = colors.black },
      },
      insert = {
        a = { bg = colors.green, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
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
            'filetype', 'searchcount',
	            colored = false,
              icon_only = true,
              padding = { left = 1, right = 2},
              separator = { left = '', right = ''},
          },
        },

        lualine_y = {
          {
            'branch', 'diff', 'diagnostics',

            colored = true,
            symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H', added = '+', modified = '~', removed = '-'},

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
