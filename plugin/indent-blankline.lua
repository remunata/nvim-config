require('lze').load {
  'indent-blankline.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('ibl').setup()
  end,
}
