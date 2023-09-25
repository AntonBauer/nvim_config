-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local which_key = require('which-key')
local telescope_buildin = require('telescope.builtin')
local telescope_scripts = require('scripts.telescope')
local text_move = require('move')
local dap = require('dap')
local dapui = require('dapui')

-- [[ Normal mode ]] 
which_key.register({
  -- [[ Telescope mappings ]]
  ['<leader>'] = {
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
  },

  -- [[ Misc mappings ]]
  ['<leader>o'] = {
    x = { vim.cmd.Ex, '[O]pen file e[X]plorer' }
  },

  -- [[ Text move mappings ]]
  ['<A-j>'] = { function() text_move.MoveLine(1) end, 'Move current line one line down', noremap=true },
  ['<A-k>'] = { function() text_move.MoveLine(-1) end, 'Move current line one line up', noremap=true },
  ['<A-h>'] = { function() text_move.MoveHChar(-1) end, 'Move current char one symbol left', noremap=true },
  ['<A-l>'] = { function() text_move.MoveHChar(1) end, 'Move current char one symbol right', noremap=true },

  -- [[ Debug mappings ]]
  ['<F3>'] = { dap.step_out, 'Debug: Step Out' },
  ['<F5>'] = { dap.continue, 'Debug: Start/Continue' },
  ['<F7>'] = { dapui.toggle, 'Debug: See last session result' },
  ['<F9>'] = { dap.toggle_breakpoint, 'Debug: Toggle Breakpoint' },
  ['<leader><F9>'] = { function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, 'Debug: Set conditional Breakpoint' },
  ['<F10>'] = { dap.step_over, 'Debug: Step Over' },
  ['F11'] = { dap.step_into, 'Debug: Step into' },
})

-- [[ Visual mode ]]
which_key.register({
})

-- [[ Move selections ]]
local opts = { noremap = true, silent = true }
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
