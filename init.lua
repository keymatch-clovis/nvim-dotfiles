-- enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Require all the main configuration.
require("config.options")
require("config.keymaps")
require("config.autocmds")

require("core.pack")
require("core.lsp")
