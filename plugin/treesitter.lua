require('lze').load {
  'nvim-treesitter',
  event = 'DeferredUIEnter',
  after = function()
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
