local function faster_get_path(name)
  local path = vim.tbl_get(package.loaded, 'nixCats', 'pawsible', 'allPlugins', 'opt', name)
  if path then
    vim.cmd.packadd(name)
    return path
  end
  return nil -- nil will make it default to normal behavior
end

---packadd + after/plugin
---@type fun(names: string[]|string)
local load_w_after_plugin = require('lzextras').make_load_with_afters({ 'plugin' }, faster_get_path)

-- NOTE: packadd doesnt load after directories.
-- hence, the above function that you can get from luaUtils that exists to make that easy.

require('lze').load {
  {
    'cmp-buffer',
    on_plugin = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'cmp-cmdline',
    on_plugin = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'cmp-cmdline-history',
    on_plugin = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'cmp-nvim-lsp',
    on_plugin = { 'nvim-cmp' },
    dep_of = { 'nvim-lspconfig' },
    load = load_w_after_plugin,
  },
  {
    'cmp-nvim-lsp-signature-help',
    on_plugin = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'cmp-nvim-lua',
    on_plugin = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'cmp-path',
    on_plugin = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'cmp_luasnip',
    on_plugin = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'friendly-snippets',
    dep_of = { 'nvim-cmp' },
  },
  {
    'lspkind.nvim',
    dep_of = { 'nvim-cmp' },
    load = load_w_after_plugin,
  },
  {
    'luasnip',
    dep_of = { 'nvim-cmp' },
    after = function()
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      local ls = require 'luasnip'

      vim.keymap.set({ 'i', 's' }, '<M-n>', function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)
    end,
  },

  {
    'nvim-cmp',
    on_require = { 'cmp' },
    after = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require 'lspkind'

      cmp.setup {
        formatting = {
          format = lspkind.cmp_format {
            mode = 'text',
            with_text = true,
            maxwidth = 50,
            ellipsis_char = '...',

            menu = {
              buffer = '[BUF]',
              nvim_lsp = '[LSP]',
              nvim_lsp_signature_help = '[LSP]',
              nvim_lsp_document_symbol = '[LSP]',
              nvim_lua = '[API]',
              path = '[PATH]',
              luasnip = '[SNIP]',
            },
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-p>'] = cmp.mapping.scroll_docs(-4),
          ['<C-n>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
        enabled = function()
          return vim.bo[0].buftype ~= 'prompt'
        end,
        experimental = {
          native_menu = false,
          ghost_text = false,
        },
      }

      cmp.setup.filetype('lua', {
        sources = cmp.config.sources {
          { name = 'nvim_lua' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
        {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' },
            },
          },
        },
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'nvim_lsp_document_symbol' },
          { name = 'buffer' },
          { name = 'cmdline_history' },
        },
        view = {
          entries = { name = 'wildmenu', separator = '|' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'cmdline' },
          { name = 'cmdline_history' },
          { name = 'path' },
        },
      })
    end,
  },
}
