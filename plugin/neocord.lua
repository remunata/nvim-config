require('lze').load {
  'neocord',
  event = 'DeferredUIEnter',
  after = function()
    require('neocord').setup {}
  end,
}
