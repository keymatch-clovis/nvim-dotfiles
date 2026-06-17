vim.pack.add { "https://github.com/folke/flash.nvim" }

require('flash').setup()

vim.keymap.set(
    'n',
    'gs',
    function() require('flash').jump() end,
    { desc = 'Flash' }
)
