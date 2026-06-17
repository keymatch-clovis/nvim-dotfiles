-- [[ Intro to `vim.pack` ]]
-- `vim.pack` is a new plugin manager built into Neovim,
--  which provides a Lua interface for installing and managing plugins.
--
--  See `:help vim.pack`, `:help vim.pack-examples` or the
--  excellent blog post from the creator of vim.pack and mini.nvim:
--  https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
--
--  To inspect plugin state and pending updates, run
--    :lua vim.pack.update(nil, { offline = true })
--
--  To update plugins, run
--    :lua vim.pack.update()
--
--
--  Throughout the rest of the config there will be examples
--  of how to install and configure plugins using `vim.pack`.
--
--  In this section we set up some autocommands to run build
--  steps for certain plugins after they are installed or updated.

local function run_build(name, cmd, cwd)
    local result = vim.system(cmd, { cwd = cwd }):wait()
    if result.code ~= 0 then
        local stderr = result.stderr or ''
        local stdout = result.stdout or ''
        local output = stderr ~= '' and stderr or stdout
        if output == '' then output = 'No output from build command.' end
        vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
    end
end

-- This autocommand runs after a plugin is installed or updated and
--  runs the appropriate build command for that plugin if necessary.
--
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind
        if kind ~= 'install' and kind ~= 'update' then return end

        if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
            run_build(name, { 'make' }, ev.data.path)
            return
        end

        if name == 'LuaSnip' then
            if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then
                run_build(name,
                { 'make', 'install_jsregexp' }, ev.data.path)
            end
            return
        end

        if name == 'nvim-treesitter' then
            if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
            vim.cmd 'TSUpdate'
            return
        end
    end,
})

---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

---Register plugins here!
require('plugins.colorscheme')
require('plugins.which-key')
require('plugins.oil')
require('plugins.guess-indent')
require('plugins.gitsigns')

-- Highlight todo, notes, etc in comments
require('plugins.todo-comments')

-- [[ mini.nvim ]]
--  A collection of various small independent plugins/modules
require('plugins.mini')

-- Statusline
require('plugins.lualine')

-- File navigation
require('plugins.fzf-lua')

-- [[ LSP Configuration ]]
-- Brief aside: **What is LSP?**
--
-- LSP is an initialism you've probably heard, but might not understand what it is.
--
-- LSP stands for Language Server Protocol. It's a protocol that helps editors
-- and language tooling communicate in a standardized fashion.
--
-- In general, you have a "server" which is some tool built to understand a particular
-- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
-- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
-- processes that communicate with some "client" - in this case, Neovim!
--
-- LSP provides Neovim with features like:
--  - Go to definition
--  - Find references
--  - Autocompletion
--  - Symbol Search
--  - and more!
--
-- Thus, Language Servers are external tools that must be installed separately from
-- Neovim. This is where `mason` and related plugins come into play.
--
-- If you're wondering about lsp vs treesitter, you can check out the wonderfully
-- and elegantly composed help section, `:help lsp-vs-treesitter`

-- Useful status updates for LSP.
require('plugins.fidget')
require('plugins.mason')

-- [Formatting]
require('plugins.conform')

-- [Autocomplete & Snippets]
-- Snippet engine
require('plugins.luasnip')
-- Autocomplete engine
require('plugins.blink')

-- [Treesitter]
require('plugins.treesitter')

-- (Movement?)
require('plugins.flash')
