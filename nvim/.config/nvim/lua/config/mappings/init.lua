local set = vim.keymap.set
local opts = { noremap = true, silent = true }

set('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '

set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

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
set('n', '<leader>z', '<Cmd>BufferPrevious<CR>', opts)
set('n', '<leader>o', '<Cmd>BufferNext<CR>', opts)
set('n', '<leader>c>', '<Cmd>BufferClose<CR>', opts)

-- Telescope
set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
