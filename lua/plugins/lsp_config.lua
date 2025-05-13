return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua lsp
            vim.lsp.config("lua_ls", {
                settings = {
                    capabilities = capabilities,
                    ["lua_ls"] = {}
                },
            })

            -- rust lsp
            vim.lsp.config("rust_analyzer", {
                settings = {
                    capabilities = capabilities,
                    ["rust_analyzer"] = {},
                }
            })

            vim.lsp.enable("lus_ls")
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

            -- Allows error text to appear inline
            vim.diagnostic.config({virtual_text = true})
        end
    },
    -- Rust specific
    {
        "mrcjkb/rustaceanvim",
        version = "^6",
        lazy = false,

        config = function()
            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, bufnr)
                        -- keymaps
                    end,
                    
                    default_settings = {
                        ["rust-analyzer"] = {},
                        capabilities = capabilities,
                    },
                },
            }
        end
    }
}

