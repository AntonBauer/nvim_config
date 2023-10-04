return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

    -- Signature help, docs and completion
    'folke/neodev.nvim',
  },
  config = function()
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- Create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description
      local which_key = require('which-key')
      local telescope_builtin = require('telescope.builtin')
      local helpers = require('scripts.helpers')

      which_key.register({
        name = 'LSP',
        ['<leader>'] = {
          ['D'] = { vim.lsp.buf.type_definition, 'LSP: Type [D]efinition', buffer = bufnr },
          ['ca'] = { vim.lsp.buf.code_action, 'LSP: [C]ode [A]ction', buffer = bufnr },
          ['rn'] = { vim.lsp.buf.rename, 'LSP: [R]e[N]ame', buffer = bufnr },
          ['ds'] = { telescope_builtin.lsp_document_symbols, 'LSP: [D]ocument [S]ymbols', buffer = bufnr },

          ['wa'] = { vim.lsp.buf.add_workspace_folder, 'LSP: [W]orkspace [A]dd Folder', buffer = bufnr },
          ['wl'] = { helpers.workspace_list_folders, 'LSP: [W]orkspace [L]ist Folders', buffer = bufnr },
          ['wr'] = { vim.lsp.buf.remove_workspace_folder, 'LSP: [W]orkspace [R]emove Folder', buffer = bufnr },
          ['ws'] = { telescope_builtin.lsp_dynamic_workspace_symbols, 'LSP: [W]orkspace [S]ymbols', buffer = bufnr },
        },
        g = {
          d = { vim.lsp.buf.definition, 'LSP: [G]oto [D]efinition', buffer = bufnr },
          r = { telescope_builtin.lsp_references, 'LSP: [G]oto [R]eferences', buffer = bufnr },
          I = { vim.lsp.buf.implementation, 'LSP: [G]oto [I]mplementation', buffer = bufnr },
          D = { vim.lsp.buf.declaration, 'LSP: [G]oto [D]eclaration', buffer = bufnr }
        },

        
        -- See `:help K` for why this keymap
        ['K'] = { vim.lsp.buf.hover, 'LSP: Hover Documentation', buffer = bufnr },
        ['<C-k>'] = { vim.lsp.buf.signature_help, 'LSP: Signature Documentation', buffer = bufnr }
      })
      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    --
    --  If you want to override the default filetypes that your language server will attach to you can
    --  define the property 'filetypes' to the map in question.
    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      omnisharp = {}
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }
  end
}
