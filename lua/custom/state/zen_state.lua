local orig_colors_name = nil
local normal_zen = { kanagawa = 'kanagawa-dragon', tokyonight = 'tokyonight-night' }

local S = {}

function S.get_orig_colors_name()
  return orig_colors_name
end

function S.get_zen_colors_name(color)
  local new_colors_name = nil
  for normal, zen in pairs(normal_zen) do
    if string.sub(color, 1, #normal) == normal then
      new_colors_name = zen
      return new_colors_name
    end
  end
  return nil
end

function S.set_orig_colors_name(v)
  orig_colors_name = v
end

return S
