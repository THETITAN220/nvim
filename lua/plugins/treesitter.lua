return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "css",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "asm", -- 👈 add this
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            multiwindow = true,
        },
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
}
