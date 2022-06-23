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
set('n', '<leader><', '<Cmd>BufferPrevious<CR>', opts)
set('n', '<leader>>', '<Cmd>BufferNext<CR>', opts)
set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
set('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
set('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
set('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)

-- Telescope
set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
