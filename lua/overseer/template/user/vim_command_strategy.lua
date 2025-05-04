local util = require 'overseer.util'

---@class overseer.VimCommandStrategy : overseer.Strategy
---@field bufnr integer
---@field task nil|overseer.Task
local VimCommandStrategy = {}

---Strategy used for unit testing
---@return overseer.Strategy
function VimCommandStrategy.new()
  local strategy = {
    task = nil,
    bufnr = vim.api.nvim_create_buf(false, true),
  }
  setmetatable(strategy, { __index = VimCommandStrategy })
  ---@type overseer.VimCommandStrategy
  return strategy
end

function VimCommandStrategy:reset()
  self.task = nil
  vim.api.nvim_buf_set_lines(self.bufnr, 0, -1, true, {})
end

function VimCommandStrategy:get_bufnr()
  return self.bufnr
end

---Simulate output from the task
---@param lines string|string[]
function VimCommandStrategy:send_output(lines)
  if type(lines) == 'string' then
    lines = vim.split(lines, '\n')
  end
  vim.api.nvim_buf_set_lines(self.bufnr, -1, -1, true, lines)
  self.task:dispatch('on_output', table.concat(lines, '\n'))
  self.task:dispatch('on_output_lines', lines)
end

---Simulate task exiting
---@param code nil|integer
function VimCommandStrategy:send_exit(code)
  -- Feed one last line end to flush the output
  self.task:dispatch('on_output', '\n')
  self.task:dispatch('on_output_lines', { '' })
  self.task:on_exit(code or 0)
end

---@param task overseer.Task
function VimCommandStrategy:start(task)
  self.task = task
end

function VimCommandStrategy:stop()
  self:send_exit(1)
end

function VimCommandStrategy:dispose()
  if self.task:is_running() then
    self:stop()
  end
  util.soft_delete_buf(self.bufnr)
end

return VimCommandStrategy
