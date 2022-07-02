local saga = require 'lspsaga'
local codeaction = require 'lspsaga.codeaction'

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

saga.init_lsp_saga({
  move_in_saga = { prev = 'k', next = 'j' },
  border_style = "single",
})

set('n', '<leader>f', require("lspsaga.finder").lsp_finder, opts)
set('n', '<leader>a', codeaction.code_action, opts)
set('v', '<leader>a', function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-U>', true, false, true))
  codeaction.range_code_action()
end, opts)
set("n", '<leader>S', require("lspsaga.signaturehelp").signature_help, opts)
set("n", "<leader>rn", require("lspsaga.rename").lsp_rename, opts)
set("n", "<leader>dd", require("lspsaga.diagnostic").show_line_diagnostics, opts)

local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })

set("n", "<C-t>", "<cmd>Lspsaga open_floaterm<CR>", opts)
set("t", "<C-t>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", opts)
