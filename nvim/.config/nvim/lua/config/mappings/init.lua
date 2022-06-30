local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Better ESC
set('i', 'jk', '<Esc>', opts)

-- Move line up/down
set('n', 'J', ':m .+1<CR>==', opts)
set('n', 'K', ':m .-2<CR>==', opts)
set('v', 'J', ":m '>+1<CR>gv=gv", opts)
set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Split movement
set('n', '<leader>j', '<C-W><C-J>', opts)
set('n', '<leader>k', '<C-W><C-K>', opts)
set('n', '<leader>l', '<C-W><C-L>', opts)
set('n', '<leader>h', '<C-W><C-H>', opts)

-- BarBar
set('n', '<leader>z', '<Cmd>BufferLineCyclePrev<CR>', opts)
set('n', '<leader>o', '<Cmd>BufferLineCycleNext<CR>', opts)
set('n', '<leader>p', '<Cmd>BufferLineTogglePin<CR>', opts)

-- Telescope
set('n', '<leader>ff', ':Telescope find_files<CR>', opts)

-- Saga
local codeaction = require("lspsaga.codeaction")

set('n', '<leader>f', require("lspsaga.finder").lsp_finder, opts)
set('n', '<leader>a', codeaction.code_action, opts)
set('v', '<leader>a', function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-U>', true, false, true))
  codeaction.range_code_action()
end, opts)
set("n", '<Tab>', require("lspsaga.hover").render_hover_doc, { silent = true })
set("n", '<leader>S', require("lspsaga.signaturehelp").signature_help, opts)
set("n", "<leader>rn", require("lspsaga.rename").lsp_rename, opts)
set("n", "<leader>d", require("lspsaga.diagnostic").show_line_diagnostics, opts)

local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
set("n", "<C-f>", function()
  action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
set("n", "<C-b>", function()
  action.smart_scroll_with_saga(-1)
end, { silent = true })
