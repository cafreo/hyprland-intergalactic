return {
  "karb94/neoscroll.nvim",
  config = function ()
    require('neoscroll').setup {
      hide_cursor = false,
      easing_function = sine,
    }

    local m = {}
-- Syntax: m[keys] = {function, {function arguments}}
m['<S-Up>'] = {'scroll', {'-vim.wo.scroll', 'true', '120'}}
m['<S-Down>'] = {'scroll', { 'vim.wo.scroll', 'true', '120'}}
m['<PageUp>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '120'}}
m['<PageDown>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '120'}}
m['<C-y>'] = {'scroll', {'-0.10', 'false', '100'}}
m['<C-e>'] = {'scroll', { '0.10', 'false', '100'}}
m['zt']    = {'zt', {'250'}}
m['zz']    = {'zz', {'250'}}
m['zb']    = {'zb', {'250'}}

require('neoscroll.config').set_mappings(m)
  end
}
