require('lze').load {
  'trouble.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('trouble').setup {}
  end,
  keys = {
    {
      '<leader>cd',
      '<cmd>Trouble diagnostics toggle<CR>',
      mode = { 'n' },
      desc = '[C]ode [D]iagnostics',
    },
  },
}
