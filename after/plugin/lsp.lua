local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- Standard LSP keymaps
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end, opts)
  
  -- Use lsp_zero default keymaps for additional functionality
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Mason setup
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'eslint',
    'rust_analyzer',
    'pyright',
    'bashls',
    'vimls',
    'yamlls',
    'jsonls',
    'dockerls',
    'html',
    'cssls',
    'graphql',
    'tailwindcss',
    'svelte',
  },
  handlers = {
    lsp_zero.default_setup,
    -- Custom setup for clangd
    clangd = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.offsetEncoding = { "utf-16" }
      require('lspconfig').clangd.setup({
        capabilities = capabilities,
        init_options = {
          fallbackFlags = {'-std=c++20'}
        },
      })
    end,
  }
})

-- CMP setup
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp.mapping(function()
      if require('luasnip').jumpable(1) then
        require('luasnip').jump(1)
      end
    end, {'i', 's'}),
    ['<C-b>'] = cmp.mapping(function()
      if require('luasnip').jumpable(-1) then
        require('luasnip').jump(-1)
      end
    end, {'i', 's'}),
  }),
  sources = cmp.config.sources({
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
  }, {
    {name = 'buffer'},
  })
})
