-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'lazy-install'
require('lazy').setup({
  -- NOTE: Here is where you install your plugins.
  require 'plugins'
}, {})

require 'nvim-options'
require 'keymaps'

require 'config.theme'
require 'config.telescope'
require 'config.treesitter'
require 'config.lsp'
require 'config.cmp'
-- require 'config.testing'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
