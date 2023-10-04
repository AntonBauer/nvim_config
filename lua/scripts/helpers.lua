local helpers = {}

helpers.to_display_list = function(original_list)
  local display_list = {}

  for index, item in ipairs(original_list) do
    local display_line = index .. ': ' .. item
    table.insert(display_list, display_line)
  end

  return display_list
end

helpers.workspace_list_folders = function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

return helpers
