require('lze').load {
  'conform.nvim',
  event = 'InsertEnter',
  after = function()
    local conform = require 'conform'
    conform.setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        nix = { 'nixfmt' },
        rust = { 'rustfmt' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        python = { 'isort', 'black' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        go = { 'gofumpt' },
        java = { 'google-java-format' },
      },
      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 2000,
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<leader>FF', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      }
    end, { desc = '[F]ormat [F]ile' })
  end,
}
