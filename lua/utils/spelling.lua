-- MIGRATE: spelling
local get_lang = function()
  return vim.opt_local.spelllang:get()[1]
end

local S = {}

function S.toggle_spellcheck()
  local opt = vim.opt_local
  opt.spell = not opt.spell:get()
  local lang = get_lang()
  if lang == nil or lang == 'en' then
    opt.spelllang = 'de'
  end
  print(string.format('Spell: %s (%s)', opt.spell:get(), get_lang()))
end

function S.switch_language()
  local opt = vim.opt_local
  local lang = get_lang()
  if lang == nil or lang == 'en' then
    opt.spelllang = 'de'
  else
    opt.spelllang = 'en'
  end
  print(string.format('Spell lang: %s', get_lang()))
end

return S
