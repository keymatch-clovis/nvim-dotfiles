-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup(
        'kickstart-highlight-yank',
        { clear = true }
    ),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Completion support.
-- https://gpanders.com/blog/whats-new-in-neovim-0-11/
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
        end

        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
        end

        -- defaults:
        -- https://neovim.io/doc/user/news-0.11.html#_defaults
        map("grs", vim.lsp.buf.signature_help, "Signature Documentation")
        map("grd", vim.lsp.buf.definition, "Goto Definition")
        map("grD", vim.lsp.buf.declaration, "Goto Declaration")
    end
})
