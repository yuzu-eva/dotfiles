local telescope = require 'telescope'
local actions = require 'telescope.actions'
local keymap = require 'lib.utils'.keymap

keymap('n', ';f', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
keymap('n', ';r', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
keymap('n', ';\\', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])

require('telescope').setup {
    defaults = {
        sorting_strategy = 'ascending',
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ['<C-Down>'] = actions.cycle_history_next,
                ['<C-Up>'] = actions.cycle_history_prev,
            },
        },
        file_ignore_patterns = { 
            '.git/',
            'node_modules/',
            'android/',
        },
    }
}
