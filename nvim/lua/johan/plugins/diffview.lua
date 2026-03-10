return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFileHistory" },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history (current file)" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<CR>", desc = "File history (repo)" },
        { "<leader>gx", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
    },
    config = function()
        require("diffview").setup({
            view = {
                merge_tool = {
                    layout = "diff3_mixed",
                },
            },
        })
    end,
}
