return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = true,
    init = function()
        require("flutter-tools").setup {}

        -- https://github.com/nvim-flutter/flutter-tools.nvim?tab=readme-ov-file#telescope-integration
        require("telescope").load_extension("flutter")
    end
}
