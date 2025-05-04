local component = require 'overseer.component'
local constants = require 'overseer.constants'
local form = require 'overseer.form'
local task_bundle = require 'overseer.task_bundle'
local task_editor = require 'overseer.task_editor'
local task_list = require 'overseer.task_list'
local util = require 'overseer.util'
local STATUS = constants.STATUS

--- das geht nicht - man braucht wohleine strategy
return {
  run_tsupdate = {
    desc = 'Run vim command',
    condition = function(task)
      return task:is_complete()
    end,
    run = function(task)
      vim.cmd 'print "hallo"'
    end,
  },
}
