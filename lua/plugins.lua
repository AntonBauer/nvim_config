return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Languages/dev
  require 'plugins.lsp',
  require 'plugins.debug',
  -- require 'plugins.testing',
  require 'plugins.cmp',
  require 'plugins.treesitter',

  -- Appearance
  require 'plugins.gitsigns',
  require 'plugins.theme',
  require 'plugins.status-line',
  require 'plugins.indent-guides',

  -- Telescope extensions
  require 'plugins.telescope-fzf'
}
