return {
  'stevearc/overseer.nvim',
  main = 'overseer',
  config = function()
    local overseer = require 'overseer'
    overseer.setup {
      templates = { 'builtin', 'treesitter.try_grammar' },
    }

    vim.api.nvim_create_user_command('WatchRun', function()
      overseer.run_template({ name = 'run treesitter' }, function(task)
        if task then
          task:add_component { 'restart_on_save', paths = { vim.fn.expand '%:p' } }
          local main_win = vim.api.nvim_get_current_win()
          overseer.run_action(task, 'open vsplit')
          vim.api.nvim_set_current_win(main_win)
        else
          vim.notify('WatchRun not supported for filetype ' .. vim.bo.filetype, vim.log.levels.ERROR)
        end
      end, {})
    end, {})

    -- nur einmal kein watcher
    vim.api.nvim_create_user_command('TryGrammar', function(params)
      overseer.run_template({ name = 'try grammar', params = { language = params.args } }, function(task)
        if task then
          -- TODO: hier statt fullpath einfach grammar rein
          task:add_component { 'restart_on_save', paths = { vim.fn.expand '%:p' } }
          local main_win = vim.api.nvim_get_current_win()
          overseer.run_action(task, 'open vsplit')
          vim.api.nvim_set_current_win(main_win)
        else
          vim.notify('TryGrammar not supported for filetype ' .. vim.bo.filetype, vim.log.levels.ERROR)
        end
      end, params)
    end, { nargs = 1, bang = true })

    -- TODO: WatchGrammar einbauen
    -- TODO herausfinden wie seq
  end,
}

--
-- templates = {
--     {
--       name = "Run Ex Command",
--       builder = function(params)
--         return {
--           name = "ExCommandTask",
--           cmd = "echo 'Hello from Ex command!'",
--           components = { "default" },
--         }
--       end,
--       description = "Run a simple Ex command",
--     },
--   },
