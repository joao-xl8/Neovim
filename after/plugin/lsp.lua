local lsp = require('lsp-zero').preset('recommended')

lsp.ensure_installed({
	'tsserver',
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
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }


  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)

  lsp.default_keymaps({buffer = bufnr})
end)

lsp.set_preferences({
	sign_icons = {}
})

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
