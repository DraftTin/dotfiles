return {
    {
        "mrcjkb/rustaceanvim",
        version = false, -- always use latest
        lazy = false, -- This plugin is already lazy
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = {
                            cargo = { allFeatures = true, loadOutDirsFromCheck = true },
                            procMacro = { enable = true },
                        },
                    },
                },
            }
        end,
    },
    -- {
    --     "rust-lang/rust.vim",
    --     ft = "rust",
    --     init = function()
    --         vim.g.rustfmt_autosave = 1
    --     end,
    -- },
}
