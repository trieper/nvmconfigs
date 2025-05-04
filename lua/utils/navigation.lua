local M = {}

M.yank_put_line_before = function(count)
  if count == 0 then
    count = 1 -- Default to 1 if no count is provided
  end
  vim.cmd(-count .. 'y | put!')
end

M.yank_put_line_after = function(count)
  if count == 0 then
    count = 1 -- Default to 1 if no count is provided
  end
  vim.cmd(count .. 'y | put!')
end

-- :-14m .
M.move_line_before = function(count)
  if count == 0 then
    count = 1 -- Default to 1 if no count is provided
  end
  vim.cmd(-count .. 'm .')
end

-- :14m .
M.move_line_after = function(count)
  if count == 0 then
    count = 1 -- Default to 1 if no count is provided
  end
  vim.cmd(count .. 'm .')
end

-- Parses the number preceeding a normal mode command
M.call_with_count = function(f)
  local count = vim.v.count -- Get the count (e.g., the <number> before 'ke')
  f(count)
end

return M
