vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup { }

---[ keys ]
vim.keymap.set(
    'n', 
    '<leader><space>',
    function() Snacks.picker.smart() end,
    { desc = 'Smart Find Files' }
)

vim.keymap.set(
    'n', 
    '<leader>sf',
    function() Snacks.picker.files() end,
    { desc = '[S]earch [F]iles' }
)

vim.keymap.set(
    'n', 
    '<leader>sg',
    function() Snacks.picker.grep() end,
    { desc = '[S]earch [G]rep' }
)

vim.keymap.set(
    'n', 
    '<leader>gd',
    function() Snacks.picker.lsp_definitions() end,
    { desc = '[LSP] Definitions' }
)

vim.keymap.set(
    'n', 
    '<leader>gD',
    function() Snacks.picker.lsp_declarations() end,
    { desc = '[LSP] Declarations' }
)

vim.keymap.set(
    'n', 
    '<leader>gr',
    function() Snacks.picker.lsp_references() end,
    { desc = '[LSP] References' }
)

vim.keymap.set(
    'n', 
    '<leader>gi',
    function() Snacks.picker.lsp_implementations() end,
    { desc = '[LSP] Implementations' }
)

vim.keymap.set(
    'n', 
    '<leader>gt',
    function() Snacks.picker.lsp_type_definitions() end,
    { desc = '[LSP] Type Definitions' }
)
