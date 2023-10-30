local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.tmux_navigator_no_mappings=1

keymap('n', '<leader>Q', ':bufdo bdelete<CR>')

-- Allow gf to open non-existant files
keymap('n', 'gf', ':edit <cfile><CR>')

-- Open the current file in the default program
keymap('n', '<leader>x', ':!xdg-open %<CR><CR>')

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>')
keymap('n', '<C-Down>', ':resize -2<CR>')
keymap('n', '<C-Left>', ':vertical resize -2<CR>')
keymap('n', '<C-Right>', ':vertical resize +2<CR>')

-- Quickly escape to normal mode
keymap('i', 'jj', '<Esc>')

keymap('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>')

keymap('n', '<leader>E', ':EslintFixAll<CR>')

-- Change tmux-navigator keybinds
keymap('n', '<C-h>', ':<C-U>TmuxNavigateLeft<cr>')
keymap('n', '<C-j>', ':<C-U>TmuxNavigateDown<cr>')
keymap('n', '<C-k>', ':<C-U>TmuxNavigateUp<cr>')
keymap('n', '<C-l>', ':<C-U>TmuxNavigateRight<cr>')
keymap('n', '<C-\\>', ':<C-U>TmuxNavigatePrevious<cr>')
