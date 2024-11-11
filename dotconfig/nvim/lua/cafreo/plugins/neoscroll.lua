return {
  "karb94/neoscroll.nvim",
  config = function ()
    require('neoscroll').setup ({
        mappings = {},
      hide_cursor = false,
      easing = sine,
    })
    
    neoscroll = require('neoscroll')
  local keymap = {
    ["<PageUp>"]   = function() neoscroll.ctrl_b({ duration = 120 }) end;
    ["<PageDown>"] = function() neoscroll.ctrl_f({ duration = 120 }) end; 
    ["<S-Up>"]     = function() neoscroll.ctrl_u({ duration = 120 }) end;
    ["<S-Down>"]   = function() neoscroll.ctrl_d({ duration = 120 }) end;
    ["<S-PageUp>"] = function() neoscroll.scroll(-9999999999, { duration = 120 }) end;
    ["<S-PageDown>"] = function() neoscroll.scroll(99999999999, { duration = 120 }) end;
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

end
}
