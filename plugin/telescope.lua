require('lze').load {
  'telescope.nvim',
  cmd = { 'Telescope' },
  on_require = { 'telescope' },
  keys = {
    { '<leader>sM', '<cmd>Telescope notify<CR>', mode = { 'n' }, desc = '[S]earch [M]essage' },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      mode = { 'n' },
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>s/',
      function()
        require('telescope.builtin').live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end,
      mode = { 'n' },
      desc = '[S]earch [/] in Open Files',
    },
    {
      '<leader><leader>s',
      function()
        return require('telescope.builtin').buffers()
      end,
      mode = { 'n' },
      desc = '[ ] Find existing buffers',
    },
    {
      '<leader>s.',
      function()
        return require('telescope.builtin').oldfiles()
      end,
      mode = { 'n' },
      desc = '[S]earch Recent Files ("." for repeat)',
    },
    {
      '<leader>sr',
      function()
        return require('telescope.builtin').resume()
      end,
      mode = { 'n' },
      desc = '[S]earch [R]esume',
    },
    {
      '<leader>sd',
      function()
        return require('telescope.builtin').diagnostics()
      end,
      mode = { 'n' },
      desc = '[S]earch [D]iagnostics',
    },
    {
      '<leader>sg',
      function()
        return require('telescope.builtin').live_grep()
      end,
      mode = { 'n' },
      desc = '[S]earch by [G]rep',
    },
    {
      '<leader>sw',
      function()
        return require('telescope.builtin').grep_string()
      end,
      mode = { 'n' },
      desc = '[S]earch current [W]ord',
    },
    {
      '<leader>ss',
      function()
        return require('telescope.builtin').builtin()
      end,
      mode = { 'n' },
      desc = '[S]earch [S]elect Telescope',
    },
    {
      '<leader>sf',
      function()
        return require('telescope.builtin').find_files()
      end,
      mode = { 'n' },
      desc = '[S]earch [F]iles',
    },
    {
      '<leader>sk',
      function()
        return require('telescope.builtin').keymaps()
      end,
      mode = { 'n' },
      desc = '[S]earch [K]eymaps',
    },
    {
      '<leader>sh',
      function()
        return require('telescope.builtin').help_tags()
      end,
      mode = { 'n' },
      desc = '[S]earch [H]elp',
    },
  },
  -- colorscheme = "",
  load = function(name)
    vim.cmd.packadd(name)
    vim.cmd.packadd 'telescope-fzf-native.nvim'
    vim.cmd.packadd 'telescope-ui-select.nvim'
  end,
  after = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
