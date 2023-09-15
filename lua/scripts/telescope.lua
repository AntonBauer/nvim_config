local telescope = {}

local telescope_buildin = require('telescope.builtin')
local telescope_themes = require('telescope.themes')

telescope.fuzzy_search_buffer = function ()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_buildin.current_buffer_fuzzy_find(telescope_themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

return telescope
