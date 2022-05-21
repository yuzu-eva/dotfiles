require('nvim-treesitter.configs').setup {
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
        disable = { 'NvimTree' },
        additional_vim_regex_highlighting = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['ia'] = '@parameter.inner',
                -- ['aa'] = {
                --   php = "" '@parameter.outer',

                --   python = "(function_definition) @function",
                --   cpp = "(function_definition) @function",
                --   c = "(function_definition) @function",
                --   java = "(method_declaration) @function",
            -- },
            },
        },
    },
    context_commentstring = {
        enable = true,
    },
}
