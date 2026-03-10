return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {
            "windwp/nvim-ts-autotag",
        },
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            -- enable highlighting (replaces highlight = { enable = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "json",
                    "javascript",
                    "typescript",
                    "typescriptreact",
                    "javascriptreact",
                    "tsx",
                    "yaml",
                    "html",
                    "css",
                    "prisma",
                    "markdown",
                    "svelte",
                    "graphql",
                    "bash",
                    "sh",
                    "lua",
                    "vim",
                    "dockerfile",
                    "gitignore",
                    "query",
                    "go",
                    "python",
                    "rust",
                    "c",
                    "cpp",
                    "umple",
                },
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
