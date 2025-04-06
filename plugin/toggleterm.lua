require('lze').load {
  'toggleterm.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('toggleterm').setup {
      open_mapping = [[<C-\>]],
    }
  end,
}
