require('nvim-tree').setup {
    renderer = {
        highlight_opened_files = "all",
        group_empty = true,
    },
    git = {
        ignore = false,
    },
}

vim.cmd [[highlight NvimTreeIndentMarker guifg=#30323E]]

vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
