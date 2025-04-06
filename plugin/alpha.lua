require('lze').load {
  'alpha-nvim',
  event = 'VimEnter',
  after = function()
    local startify = require 'alpha.themes.startify'
    startify.file_icons.provider = 'devicons'

    require('alpha').setup(startify.config)
  end,
}
