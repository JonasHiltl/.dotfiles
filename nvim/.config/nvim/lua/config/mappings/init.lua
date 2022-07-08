local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

-- Nvim-Tree
set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Better ESC
set('i', 'jk', '<Esc>', opts)

-- Move line up/down
set('n', 'J', ':m .+1<CR>==', opts)
set('n', 'K', ':m .-2<CR>==', opts)
set('v', 'J', ":m '>+1<CR>gv=gv", opts)
set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- VISUAL
-- Stay in indent mode
set('v', '<', '<gv', opts)
set('v', '>', '>gv', opts)
set('v', 'p', '"_dP', opts)

-- Split movement
-- set('n', '<leader>j', '<C-W><C-J>', opts)
-- set('n', '<leader>k', '<C-W><C-K>', opts)
-- set('n', '<leader>l', '<C-W><C-L>', opts)
-- set('n', '<leader>h', '<C-W><C-H>', opts)
set('n', '<leader>j', ':NavigatorDown<CR>')
set('n', '<leader>k', ':NavigatorUp<CR>')
set('n', '<leader>h', ':NavigatorLeft<CR>')
set('n', '<leader>l', ':NavigatorRight<CR>')
set('n', '<leader>p', ':NavigatorPrevious<CR>')

-- Bufferline
set('n', '<leader>z', '<Cmd>BufferLineCyclePrev<CR>', opts)
set('n', '<leader>o', '<Cmd>BufferLineCycleNext<CR>', opts)

-- Telescope
local builtin = require 'telescope.builtin'
set('n', '<leader>ff', builtin.find_files, opts)
set('n', '<leader>fr', builtin.lsp_references, opts)
set('n', '<leader>fd', builtin.lsp_definitions, opts)
set('n', '<leader>fe', builtin.diagnostics, opts)
