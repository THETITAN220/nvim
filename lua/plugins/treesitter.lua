return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "lua",
            "cpp",
            "c",
            "javascript",
            "typescript",
            "python",
            "json",
            "html",
            "css",
            "go",
            "rust",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
}
