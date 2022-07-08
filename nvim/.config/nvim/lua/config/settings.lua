local set = vim.opt

vim.notify = require("notify")

set.termguicolors  = true
set.expandtab      = true
set.smarttab       = true
set.shiftwidth     = 2
set.tabstop        = 2
set.cursorline     = true
set.relativenumber = true
set.numberwidth    = 2
set.smartcase      = true
set.hlsearch       = true
set.updatetime     = 100
set.clipboard      = "unnamedplus";
set.mouse          = "a";
set.undodir        = vim.fn.stdpath "cache" .. "/undo"
set.undofile       = true
set.swapfile       = true
