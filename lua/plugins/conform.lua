vim.pack.add { "https://github.com/stevearc/conform.nvim" }
require('conform').setup {
    notify_on_error = false,
    default_format_opts = {
        -- Use external formatters if configured below, otherwise use LSP
        -- formatting. Set to `false` to disable LSP formatting entirely.
        lsp_format = 'fallback',
    },
}

vim.keymap.set(
    { 'n', 'v' },
    '<leader>f',
    function() require('conform').format { async = true } end,
    { desc = '[F]ormat buffer' }
)
