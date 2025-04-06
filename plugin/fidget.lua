require('lze').load {
  'fidget.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('fidget').setup {
      notification = {
        window = {
          winblend = 0,
        },
      },
    }
  end,
}
