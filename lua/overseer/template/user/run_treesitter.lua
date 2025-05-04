---@module 'overseer.template'
---@type overseer.TemplateDefinition
return {
  name = 'try grammarof',
  desc = 'Test grammar on source (e.g. ultisnips)',
  builder = function(language)
    language = language or 'snippets'
    print(string.format('language: %s', language))
    -- local file = vim.fn.expand '%:p'
    local cmd = { file }
    local cwd = vim.fs.joinpath(vim.fn.stdpath 'config', '/tree-sitter/', string.format('tree-sitter-%s', language))
    if vim.bo.filetype == 'javascript' then
      cmd = { 'test.sh' }
    end
    return {
      cmd = cmd,
      cwd = cwd,
      components = {
        { 'on_output_quickfix', set_diagnostics = true },
        'on_result_diagnostics',
        'default',
      },
    }
  end,
  condition = {
    filetype = { 'javascript' },
  },
}
