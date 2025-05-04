local isfile = function(file)
  local f = io.open(file, 'r')
  return f ~= nil and io.close(f)
end

local joinpath = vim.fs.joinpath
local config_dir = vim.fn.stdpath 'config'
local ts_dir = joinpath(config_dir, 'tree-sitter')
local snippets_dir = config_dir .. 'snippets/UltiSnips'

local get_grammar_path = function(lang)
  local cwd = joinpath(ts_dir, string.format('tree-sitter-%s', lang))
  if isfile(joinpath(cwd, 'grammar.js')) then
    return cwd
  end
end

---@module 'overseer.template'
---@type overseer.TemplateDefinition
return {
  name = 'try grammar',
  desc = 'Test local grammar of source (e.g. ultisnips)',
  builder = function(params)
    print(params.language)
    local lang = params.language or 'snippets'
    local cmd = 'tree-sitter generate'

    -- das gehört in callback... hier ist es zu spät
    local cwd = joinpath(ts_dir, string.format('tree-sitter-%s', lang))
    local grammar_path = get_grammar_path(lang)
    if grammar_path then
      return {
        cmd = cmd,
        cwd = cwd,
        components = {
          { 'on_output_quickfix', set_diagnostics = true },
          'on_result_diagnostics',
          'default',
        },
      }
    else
      error(string.format('Keine Grammatik für Sprache: %s', lang))
    end
  end,
  --- callback ist hier nicht nützlich
}
