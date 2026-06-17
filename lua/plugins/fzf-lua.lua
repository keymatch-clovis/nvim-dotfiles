vim.pack.add { 'https://github.com/ibhagwan/fzf-lua' }

require('fzf-lua').setup()

-- once loaded we can use the global object `FzfLua`

---[ keys ]

-- find files. respect `.gitignore`
vim.keymap.set(
    'n', 
    '<leader>ff',
    FzfLua.files,
    { desc = '[F]ind [F]iles' }
)

-- some kind of grep search
vim.keymap.set(
    'n', 
    '<leader>fg',
    FzfLua.live_grep_native,
    { desc = '[S]earch [G]rep' }
)

-- 
vim.keymap.set(
    'n', 
    '<leader>gd',
    FzfLua.lsp_definitions,
    { desc = '[LSP] Definitions' }
)

vim.keymap.set(
    'n', 
    '<leader>gD',
    FzfLua.lsp_declarations,
    { desc = '[LSP] Declarations' }
)

vim.keymap.set(
    'n', 
    '<leader>gr',
    FzfLua.lsp_references,
    { desc = '[LSP] References' }
)

vim.keymap.set(
    'n', 
    '<leader>gi',
    FzfLua.lsp_implementations,
    { desc = '[LSP] Implementations' }
)

vim.keymap.set(
    'n', 
    '<leader>gt',
    FzfLua.lsp_typedefs,
    { desc = '[LSP] Type Definitions' }
)

-- I like to see some keymaps from time to time.
vim.keymap.set(
    'n',
    '<leader>sk',
    FzfLua.keymaps,
    { desc = '[S]earch [K]eymaps' }
)

