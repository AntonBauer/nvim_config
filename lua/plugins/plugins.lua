return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  require 'plugins.git',
  require 'plugins.lsp',
  require 'plugins.cmp',
  require 'plugins.ui',
  require 'plugins.telescope',
  require 'plugins.treesitter',
}
