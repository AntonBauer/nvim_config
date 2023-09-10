local helpers = {}

helpers.to_display_list = function(original_list)
  local display_list = {}

  for index, item in ipairs(original_list) do
    local display_line = index .. ': ' .. item
    table.insert(display_list, display_line)
  end

  return display_list
end

return helpers
