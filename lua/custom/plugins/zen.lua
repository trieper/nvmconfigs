return {
  'folke/zen-mode.nvim',
  config = function()
    ---@module 'custom.plugins.zen_state'
    local state = require 'custom.state.zen_state'
    require('zen-mode').setup {
      window = { width = 0.90 },
      on_open = function()
        local colors_name = vim.g.colors_name
        local new_colors_name = state.get_zen_colors_name(colors_name)
        state.set_orig_colors_name(colors_name)
        if new_colors_name then
          print('ZEEEEEEEEEEN: ' .. new_colors_name)
          vim.cmd('colorscheme ' .. new_colors_name)
        end
      end,
      on_close = function()
        local old_color = state.get_orig_colors_name()
        vim.cmd('colorscheme ' .. old_color)
      end,
    }
  end,
  keys = {
    {
      '<leader>tz',
      function()
        require('zen-mode').toggle()
      end,
      desc = '[t]oggle [z]en mode',
    },
  },
}
