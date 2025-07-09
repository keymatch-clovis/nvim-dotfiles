return {
    'mbbill/undotree',
    config = function()
        vim.cmd [[ let g:undotree_SetFocusWhenToggle = 1]]
    end,
    keys = {
        {
            '<leader>U',
            function()
                vim.cmd.UndotreeToggle()
            end,
            desc = '[U]ndotree',
        },
    },
}
