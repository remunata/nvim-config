vim.lsp.set_log_level 'debug'

require('lze').load {
  {
    'nvim-lspconfig',
    on_require = { 'lspconfig' },
    lsp = function(plugin)
      require('lspconfig')[plugin.name].setup(vim.tbl_extend('force', {
        capabilities = require('lsp_utils').get_capabilities(plugin.name),
        on_attach = require('lsp_utils').on_attach,
      }, plugin.lsp or {}))
    end,
  },
  {
    'lazydev.nvim',
    cmd = { 'LazyDev' },
    ft = 'lua',
    after = function(_)
      require('lazydev').setup {
        library = {
          { words = { 'nixCats' }, path = (nixCats.nixCatsPath or '') .. '/lua' },
        },
      }
    end,
  },
  {
    'lua_ls',
    lsp = {
      filetypes = { 'lua' },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          formatters = {
            ignoreComments = true,
          },
          signatureHelp = { enabled = true },
          diagnostics = {
            globals = { 'nixCats', 'vim' },
            disable = { 'missing-fields' },
          },
          telemetry = { enabled = false },
        },
      },
    },
  },
  {
    'nixd',
    lsp = {
      filetypes = { 'nix' },
      settings = {
        nixd = {
          nixpkgs = {
            expr = nixCats.extra 'nixdExtras.nixpkgs' or [[import <nixpkgs> {}]],
          },
          options = {
            nixos = {
              expr = nixCats.extra 'nixdExtras.nixos_options',
            },
            ['home-manager'] = {
              expr = nixCats.extra 'nixdExtras.home_manager_options',
            },
          },
          formatting = {
            command = { 'nixfmt' },
          },
          diagnostic = {
            suppress = {
              'sema-escaping-with',
            },
          },
        },
      },
    },
  },
  {
    'rust_analyzer',
    lsp = {
      filetypes = { 'rust' },
    },
  },
  {
    'pyright',
    lsp = {
      filetypes = { 'python' },
    },
  },
  {
    'clangd',
    lsp = {
      filetypes = { 'c', 'cpp' },
    },
  },
  {
    'ts_ls',
    lsp = {
      filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
    },
  },
  {
    'jdtls',
    lsp = {
      filetypes = { 'java' },
    },
  },
  {
    'gopls',
    lsp = {
      filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    },
  },
}
