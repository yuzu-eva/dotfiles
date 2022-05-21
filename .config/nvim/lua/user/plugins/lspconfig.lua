local buf_option = vim.api.nvim_buf_set_option
local buf_keymap = require 'lib.utils'.buf_keymap

vim.diagnostic.config {
    virtual_text = false,
    severity_sort = true,
    float = {
        source = true,
        focus = false,
        format = function(diagnostic)
        if diagnostic.user_data ~= nil and diagnostic.user_data.lsp.code ~= nil then
            return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
        end
        return diagnostic.message
    end,
    }
}

local on_attach = function(_, bufnr)
    buf_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    buf_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    buf_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_keymap(bufnr, 'n', 'gr', ':Telescope lsp_references<CR>')

    buf_keymap(bufnr, 'n', '<leader>ca', ':CodeActionMenu<CR>')
    buf_keymap(bufnr, 'v', '<leader>ca', ':CodeActionMenu<CR>')

    buf_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    buf_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    buf_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    buf_keymap(bufnr, 'n', '<leader>F', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')

    -- if _.server_capabilities.document_formatting then
    --     vim.api.nvim_command [[augroup Format]]
    --     vim.api.nvim_command [[autocmd! * <buffer>]]
    --     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    --     vim.api.nvim_command [[augroup END]]
    -- end
    
end



require'lspconfig'.eslint.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    handlers = {
        ['window/showMessageRequest'] = function(_, result, _) return result end,
    },
}

require'lspconfig'.tsserver.setup{
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
}
-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _)
    if msg:match 'exit code' then
        return
    end
        if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end
