-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'lazy-install'
require('lazy').setup({
  require 'plugins'
}, {})

require 'nvim-options'
require 'keymaps'

require 'config.telescope'
require 'config.treesitter'
require 'config.lsp'
require 'config.cmp'
require 'config.testing'

-- NeoVim ToDos:
  -- format on save
  -- plugin installation and configuration in one place

-- DotNet ToDos:
  -- Auto usings/Import missing usings
  -- code snippets
  -- refactorings?
  -- sane formatting defaults

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
