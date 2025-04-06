require('lze').load {
  'precognition.nvim',
  keys = {
    {
      '<leader>tp',
      function()
        require('precognition').toggle()
      end,
      mode = { 'n' },
      desc = '[T]oggle [P]recognition',
    },
  },
}
