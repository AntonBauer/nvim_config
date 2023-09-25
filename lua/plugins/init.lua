return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Vertical/Horizontal text move
  'fedepujol/move.nvim',

  -- Keymaps documentation
  require 'plugins.which-key',

  -- Languages/dev
  require 'plugins.lsp',
  require 'plugins.debug',
  require 'plugins.testing',
  require 'plugins.cmp',
  require 'plugins.treesitter',

  -- Appearance
  require 'plugins.gitsigns',
  require 'plugins.theme',
  require 'plugins.status-line',
  require 'plugins.indent-guides',

  -- Telescope files finder
  require 'plugins.telescope-fzf'
}
