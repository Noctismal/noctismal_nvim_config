-- Tree sitter 

return {
    "nvim-treesitter/nvim-treesitter",
    builid = ":TSUpdate",
    config = function() 
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "c",
                "rust",
                "java",
                "javascript",
                "python",
            },
            highlight = {enable = true},
            indent = {enable = true},
        })
    end
}
