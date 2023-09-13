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
