-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local rec = { remap = true }
--- German umlauts, recursive
vim.keymap.set('n', 'ä', ']', rec)
vim.keymap.set('n', 'ü', '[', rec)
vim.keymap.set('n', '<leader>w', '<C-w>', rec)
vim.keymap.set('n', '<leader>h', '<C-w>h', rec)
vim.keymap.set('n', '<leader>j', '<C-w>j', rec)
vim.keymap.set('n', '<leader>k', '<C-w>k', rec)
vim.keymap.set('n', '<leader>l', '<C-w>l', rec)

vim.keymap.set('n', 'gp', '<cmd>b#<CR>')
--- TODO: evtl. raus
vim.keymap.set('n', '<BS>', '<cmd>b#<CR>')

vim.keymap.set('n', '<C-x>', '<cmd>. lua</CR>', { desc = 'Zeile in lua laden' })

function ToggleVirtualText()
  virtual_text_enabled = not virtual_text_enabled
  vim.diagnostic.config {
    virtual_text = virtual_text_enabled,
  }
end

vim.keymap.set('n', '<leader>l', '<C-w>l', rec)

-- Create a Lua function to execute the desired command
local function custom_yank_and_put(args)
  -- Get the argument (number) passed to the Yp- command
  local count = tonumber(args.args)

  if not count then
    -- If no valid number is provided, print an error message
    vim.api.nvim_err_writeln 'Please provide a valid number as an argument.'
    return
  end

  -- Create the Ex command string
  local ex_command = string.format('-%dy | put!', count)

  -- Execute the Ex command
  vim.cmd(ex_command)
end

-- Wahrscheinlich eine schlecte idee
vim.api.nvim_create_user_command('P', function(opts)
  local range_start = opts.line1 -- Start of the range
  local range_end = opts.line2 -- End of the range
  local args = opts.args -- The rest of the command after the range

  -- Print the parsed range and the command for demonstration
  print('Range start:', range_start)
  print('Range end:', range_end)
  print('Command arguments:', args)

  -- Add your custom logic here to handle the range and command
  vim.cmd(range_start .. ',' .. range_end .. 'y | put!')
end, {
  range = true, -- Enable range parsing
  desc = 'Yank put für range',
})

local nav = require 'utils/navigation'

-- zeile kopieren
vim.keymap.set('n', '<leader>-yp', function()
  nav.call_with_count(nav.yank_put_line_before)
end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>yp', function()
  nav.call_ith_count(nav.yank_put_line_before)
end, { noremap = true, silent = true })

-- MIGRATE: spelling
vim.keymap.set('n', '<leader>tsp', function()
  require('utils.spelling').toggle_spellcheck()
end, { desc = 'Toggle: spell' })

vim.keymap.set('n', '<leader>tsl', function()
  require('utils.spelling').switch_language()
end, { desc = 'Toggle: spell language' })
-- Hullo
vim.keymap.set('n', 'zs', '1z=', { silent = true, desc = 'Spell: erste suggestion' })

-- vim: ts=2 sts=2 sw=2 et
