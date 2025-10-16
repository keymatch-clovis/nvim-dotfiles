return {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    -- If set to lazy, gitsigns does not start for me, for some reason.
    lazy = false,
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged_enable = true,
    },
    keys = {
        {
            '<leader>gb',
            function()
                require('gitsigns').blame_line({ full = true })
            end,
            mode = 'n',
            desc = '[G]itsigns [B]lame Line',
        },
    },
}
