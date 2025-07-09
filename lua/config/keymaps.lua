-- I like oil c:
vim.keymap.set('n', '<leader>o', '<CMD>Oil<CR>', { desc = '[O]pen parent directory' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set(
    'n',
    '<leader>l',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic [L]ocation list' }
)

-- Location list keymaps
vim.keymap.set('n', '<M-h>', '<cmd>lnext<CR>')
vim.keymap.set('n', '<M-l>', '<cmd>lprev<CR>')

-- Quickfix list keymaps
vim.keymap.set('n', '<S-M-h>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<S-M-l>', '<cmd>cprev<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set(
    't',
    '<Esc><Esc>',
    '<C-\\><C-n>',
    { desc = 'Exit terminal mode' }
)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set(
    'n',
    '<C-h>',
    '<C-w><C-h>',
    { desc = 'Move focus to the left window' }
)
vim.keymap.set(
    'n',
    '<C-l>',
    '<C-w><C-l>',
    { desc = 'Move focus to the right window' }
)
vim.keymap.set(
    'n',
    '<C-j>',
    '<C-w><C-j>',
    { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
    'n',
    '<C-k>',
    '<C-w><C-k>',
    { desc = 'Move focus to the upper window' }
)

-- Move highlighted line up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Move by half a screen and keep the cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search and keep the cursor centered, I think
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- greatest remap ever
vim.keymap.set(
    'x',
    '<leader>p',
    [["_dP]],
    { desc = 'Copy without losing the clip' }
)

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- This is going to get me cancelled, way comfy
vim.keymap.set('i', '<C-c>', '<Esc>')
