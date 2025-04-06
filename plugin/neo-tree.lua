require('lze').load {
  'neo-tree.nvim',
  keys = {
    { '\\', '<cmd>Neotree reveal<CR>', mode = { 'n' }, desc = 'Neotree reveal' },
  },
  after = function()
    require('neo-tree').setup {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    }
  end,
}
