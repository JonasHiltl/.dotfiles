require("config.lsp.format")
local lspconfig = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")

local set = vim.keymap.set

local on_attach = function(client, bufnr)
  -- setup auto-formatting
  require "lsp-format".on_attach(client)
  -- Add Signatures while typing
  require "lsp_signature".on_attach()

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Show diagnostic on hover
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        source = 'always',
        prefix = ' ',
        scope = 'cursor',
      }
      vim.diagnostic.open_float(nil, opts)
    end
  })

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  set('n', '<Tab>', vim.lsp.buf.hover, bufopts)
  set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup({
  ensure_installed = { 'html', 'gopls', 'tsserver', 'sumneko_lua' }
})

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend(
  "force",
  lspconfig.util.default_config,
  {
    on_attach = on_attach,
    capabilities = capabilities,
  }
)

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {}
end

require("config.lsp.languages.lua")
require("config.lsp.languages.go")
require("config.lsp.styles")
