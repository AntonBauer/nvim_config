return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',

    -- Dotnet test adapter
    'Issafalcon/neotest-dotnet'
  },

  config = function ()
    require("neotest").setup({
      adapters = {
        require("neotest-dotnet")({
          discovery_root = 'solution',
          dap = {jusMyCode = true}
        })
      }
    })

    require('neodev').setup({
      library = {
        plugins = { 'neotest' },
        types = true
      }
    })
  end
}
