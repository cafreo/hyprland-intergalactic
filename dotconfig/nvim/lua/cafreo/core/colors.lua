-- colors
    local colors = {
      white = '#C8CACC',
      black = '#201c28',
      red = '#D12411',
      green = '#94D026',
      blue = '#2677D1',
      yellow = '#F5B73B',
      violet = '#C727C4',
      orange = '#E57D29',

      inactive_bg = '#201c28',
    }
    
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.green} )

