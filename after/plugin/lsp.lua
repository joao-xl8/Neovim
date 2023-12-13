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
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }


  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)

  lsp.default_keymaps({buffer = bufnr})
  --- In lsp attach function
  local map = vim.api.nvim_buf_set_keymap

  map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
  map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
  map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
  map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
  map(0, "n", "L", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
  map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
  map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
  map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
  map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
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
