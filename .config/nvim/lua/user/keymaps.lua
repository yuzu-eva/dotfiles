local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('n', '<leader>Q', ':bufdo bdelete<CR>')

-- Allow gf to open non-existant files
keymap('n', 'gf', ':edit <cfile><CR>')

-- Quick navigation between splits
keymap('n', '<c-h>', '<c-w>h')
keymap('n', '<c-j>', '<c-w>j')
keymap('n', '<c-k>', '<c-w>k')
keymap('n', '<c-l>', '<c-w>l')

-- Insert trailing ; or , from insert mode
keymap('i', ';;', '<Esc>A;<Esc>')
keymap('i', ',,', '<Esc>A,<Esc>')

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
