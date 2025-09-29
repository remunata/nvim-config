require('lze').load {
  'toggleterm.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return 20
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.45
        end
      end,
      open_mapping = [[<C-\>]],
    }
  end,
  keys = {
    { [[<C-S-\>]], '<cmd>ToggleTerm direction=horizontal<CR>', mode = { 'n', 'i' }, desc = 'ToggleTerm Horizontal' },
    { [[<C-A-\>]], '<cmd>ToggleTerm direction=vertical<CR>', mode = { 'n', 'i' }, desc = 'ToggleTerm Vertical' },
  },
}
