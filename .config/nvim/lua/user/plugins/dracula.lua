vim.cmd([[
    augroup DraculaOverrides
        autocmd!
        autocmd ColorScheme dracula highlight! link Pmenu DraculaBg
        autocmd ColorScheme dracula highlight link NormalFloat DraculaBgLight
        autocmd ColorScheme dracula highlight FloatBorder guifg=#343746 guibg=#343746
        autocmd ColorScheme dracula highlight DraculaBoundary guibg=none
        autocmd ColorScheme dracula highlight DraculaDiffDelete ctermbg=none guibg=none
        autocmd ColorScheme dracula highlight DraculaComment cterm=italic gui=italic
        autocmd ColorScheme dracula highlight Normal guibg=#000000
    augroup end
    colorscheme dracula
]])
