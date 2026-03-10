-- return {
--     "umple/umple.nvim",
--     build = "./scripts/build.sh",
--     dependencies = {
--         "neovim/nvim-lspconfig",
--         "nvim-treesitter/nvim-treesitter",
--     },
--     config = function()
--         require("umple-lsp").setup()
--     end,
-- }

-- Local test
return {
    dir = "/Users/ningyuheng/Library/Mobile Documents/com~apple~CloudDocs/workspace/lsp_umple/umple.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("umple-lsp").setup({
            plugin_dir = "/Users/ningyuheng/Library/Mobile Documents/com~apple~CloudDocs/workspace/lsp_umple/umple.nvim",
        })
    end,
}
