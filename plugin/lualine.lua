require('lze').load {
  'lualine.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_seperators = '|',
        section_seperators = '',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
            status = true,
          },
        },
      },
      inactive_sections = {
        lualine_b = {
          {
            'filename',
            path = 3,
            status = true,
          },
        },
        lualine_x = { 'filetype' },
      },
      tabline = {
        lualine_a = { 'buffers' },
        lualine_z = { 'tabs' },
      },
    }
  end,
}
