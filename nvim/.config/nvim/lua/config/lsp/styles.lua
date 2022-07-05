local signs = {
  Error = " ",
  Warn  = " ",
  Info  = " ",
  Hint  = "ﴞ ",
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local config = {
  signs = true,
  virtual_text = false,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
}

vim.diagnostic.config(config)

local win = require "lspconfig.ui.windows"
local _default_opts = win._default_opts

win._default_opts = function(options)
  local opts = _default_opts(options)
  opts.border = "single"
  return opts
end
