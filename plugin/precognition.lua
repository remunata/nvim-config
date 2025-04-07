require('lze').load {
  'precognition.nvim',
  keys = {
    {
      '<leader>tp',
      function()
        if require('precognition').toggle() then
          vim.notify 'Precognition on'
        else
          vim.notify 'Precognition off'
        end
      end,
      mode = { 'n' },
      desc = '[T]oggle [P]recognition',
    },
  },
}
