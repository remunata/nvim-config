require('lze').load {
  'comment.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('Comment').setup()
  end,
}
