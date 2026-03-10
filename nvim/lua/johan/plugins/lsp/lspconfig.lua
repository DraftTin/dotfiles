return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        -- LSP keymaps (applied to all LSP clients via LspAttach)
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local buf = ev.buf
                local map = vim.keymap.set
                local function opts(desc)
                    return { buffer = buf, noremap = true, silent = true, desc = desc }
                end

                map("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts("Show LSP references"))
                map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
                map("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts("Show LSP definitions"))
                map("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts("Show LSP implementations"))
                map("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts("Show LSP type definitions"))
                map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))
                map("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
                map("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", opts("Show buffer diagnostics"))
                map("n", "<leader>sd", vim.diagnostic.open_float, opts("Show line diagnostics"))
                map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts("Go to previous diagnostic"))
                map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts("Go to next diagnostic"))
                map("n", "K", vim.lsp.buf.hover, opts("Show documentation under cursor"))
                map("n", "<leader>rs", function()
                    vim.lsp.stop_client(vim.lsp.get_clients())
                    vim.cmd("e")
                end, opts("Restart LSP"))
            end,
        })

        -- import cmp-nvim-lsp plugin (for capabilities)
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- capabilities for autocompletion
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- diagnostic signs (unchanged)
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
            },
            virtual_text = { prefix = "●" },
            float = { border = "rounded" },
            severity_sort = true,
        })

        -- per-server configs (what used to be lspconfig[server].setup{...})
        local servers = {
            gopls = {
                capabilities = capabilities,
            },
            html = {
                capabilities = capabilities,
            },
            ts_ls = {
                capabilities = capabilities,
            },
            cssls = {
                capabilities = capabilities,
            },
            tailwindcss = {
                capabilities = capabilities,
            },
            svelte = {
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePost", {
                        pattern = { "*.js", "*.ts" },
                        callback = function(ctx)
                            if client.name == "svelte" then
                                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                            end
                        end,
                    })
                end,
                capabilities = capabilities,
            },
            prismals = {
                capabilities = capabilities,
            },
            graphql = {
                capabilities = capabilities,
                filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
            },
            emmet_ls = {
                capabilities = capabilities,
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
            },
            pyright = {
                capabilities = capabilities,
                settings = {
                    python = {
                        pythonPath = "/Users/ningyuheng/.pyenv/versions/neovim/bin/python",
                        venvPath = "/Users/ningyuheng/.pyenv/versions",
                        venv = "neovim",
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            },
            lua_ls = {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            },
            rust_analyzer = {
                capabilities = capabilities,
                settings = {
                    cargo = {
                        allFeatures = true,
                        loadOutDirsFromCheck = true,
                    },
                    procMacro = { enable = true },
                },
            },
        }

        -- register and enable all servers via Neovim 0.11 API
        for name, cfg in pairs(servers) do
            vim.lsp.config(name, cfg)
        end
        vim.lsp.enable(vim.tbl_keys(servers))
    end,
}
