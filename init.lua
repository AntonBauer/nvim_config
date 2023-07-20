-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
require 'config.lazy-nvim'

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  require 'plugins.plugins',
}, {})

-- [[ Basic Setup ]]
require 'config.nvim-setup';

-- [[ Basic Keymaps ]]
require 'config.keymaps'


-- [[ Configure Telescope ]]
require 'config.telescope'

-- [[ Configure Treesitter ]]
require 'config.treesitter'

-- [[ Configure LSP ]]
require 'config.lsp'

-- [[ Configure nvim-cmp ]]
require 'config.cmp'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
