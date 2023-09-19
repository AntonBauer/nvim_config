-- [[ Misc mappings ]]

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Treesitter keymaps ]]
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

local which_key = require('which-key')
local telescope_buildin = require('telescope.builtin')
local telescope_scripts = require('scripts.telescope')

local text_move = require('move');

which_key.register({
  ['<leader>'] = {
    -- [[ Telescope mappings ]]
    ['<space>'] = { telescope_buildin.oldfiles, '[ ] Find existing buffers' },
    ['/'] = { telescope_scripts.fuzzy_search_buffer, '[/] Fuzzily search in current buffer' },
    ['?'] = { telescope_buildin.oldfiles, '[?] Find recently opened files' },
    g = {
      f = { telescope_buildin.git_files, 'Search [G]it [F]iles' }
    },
    s = {
      d = { telescope_buildin.diagnostics, '[S]earch [D]iagnostics' },
      f = { telescope_buildin.find_files, '[S]earch [F]iles' },
      g = { telescope_buildin.live_grep, '[S]earch by [G]rep' },
      h = { telescope_buildin.help_tags, '[S]earch [H]elp' },
      w = { telescope_buildin.grep_string, '[S]earch [G]rep' },
    },

    -- [[ Misc mappings ]]
    o = {
      x = { vim.cmd.Ex, '[O]pen file e[X]plorer' }
    }
  },

  -- [[ Text move mappings ]]
  ['<A-j>'] = { function() text_move.MoveLine(1) end, 'Move current line one line down' },
  ['<A-k>'] = { function() text_move.MoveLine(-1) end, 'Move current line one line up' },
  ['<A-h>'] = { function() text_move.MoveHChar(-1) end, 'Move current char one symbol left' },
  ['<A-l>'] = { function() text_move.MoveHChar(1) end, 'Move current char one symbol right' },
})

-- [[ Move selections ]]
local opts = { noremap = true, silent = true }

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
