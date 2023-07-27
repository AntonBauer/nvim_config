return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  require 'lsp',
  require 'completion',
  require 'ui',
  require 'plugins.telescope',
  require 'plugins.treesitter',

  require 'languages.csharp.lsp'
}
