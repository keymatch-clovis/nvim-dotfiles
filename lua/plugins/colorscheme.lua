return {
    "rebelot/kanagawa.nvim",
    config = function()
        require("kanagawa").setup({
            compile = true,             -- enable compiling the colorscheme
            undercurl = true,            -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true},
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,         -- do not set background color
            dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
            terminalColors = true,       -- define vim.g.terminal_color_{0,17}
            theme = "dragon",
            -- Remove the background of LineNr, {Sign,Fold}Column and friends.
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalNC = { bg = "none" },
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },

                    -- Telescope related.
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = "none" },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "none" },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
                    TelescopePreviewNormal = { bg = "none" },
                    TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },
                }
            end,
        })
        vim.cmd("colorscheme kanagawa")
    end,
}
