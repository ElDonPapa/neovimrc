require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'pyright',
		'ts_ls',
		'lua_ls',
		'clangd',
		'html',
		'cssls',
		'jsonls',
		'bashls',
		'yamlls',
		'rust_analyzer',
		'intelephense', --php
	},
	automatic_installation = true,
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Customize specific LSPs or set defaults
require('mason-lspconfig').setup_handlers({
  function(server_name) -- Default handler for all servers
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
  -- Example of custom server setup (Lua)
  ['lua_ls'] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }, -- Recognize the `vim` global
          },
        },
      },
    })
  end,
})
