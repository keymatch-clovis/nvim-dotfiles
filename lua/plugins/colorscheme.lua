vim.pack.add { 'https://github.com/ember-theme/nvim' }
require("ember").setup({
    variant = "ember", -- "ember", "ember-soft", "ember-light", "ember-auto"
    transparent        = true, -- transparent editor background
})

---Enable the colorscheme
vim.cmd("colorscheme ember")
