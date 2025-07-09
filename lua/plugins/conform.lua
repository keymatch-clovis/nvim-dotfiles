return {
    'stevearc/conform.nvim',
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format {
                    async = true,
                    lsp_format = 'fallback',
                }
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use 'stop_after_first' to run the first available formatter from the list
            javascript = {
                'prettierd',
                'prettier',
                'biome',
                stop_after_first = true,
            },
            typescript = {
                'prettierd',
                'prettier',
                'biome',
                stop_after_first = true,
            },
            jsonc = {
                'prettierd',
                'prettier',
                'biome',
                stop_after_first = true,
            },
            json = {
                'prettierd',
                'prettier',
                'biome',
                stop_after_first = true,
            },
            javascriptreact = {
                'prettierd',
                'prettier',
                stop_after_first = true,
            },
            typescriptreact = {
                'prettierd',
                'prettier',
                stop_after_first = true,
            },
            vue = { 'prettierd', 'prettier', stop_after_first = true },
            astro = { 'prettier' },
            go = { 'gofumpt', 'golines' },
        },
    },
    init = function()
        require("conform").formatters.golines = {
            append_args = { '-m', '80' },
        }
    end
}
