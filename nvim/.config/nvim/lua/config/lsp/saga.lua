local saga = require 'lspsaga'

saga.init_lsp_saga({
  border_style = 'rounded',
  move_in_saga = { prev = 'k', next = 'j' },
  show_diagnostic_source = true,
  diagnostic_header = { " ", " ", " ", "ﴞ " },
})
