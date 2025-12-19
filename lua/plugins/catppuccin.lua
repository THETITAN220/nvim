return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha", -- latte | frappe | macchiato | mocha
        transparent_background = false,

        integrations = {
            lualine = true,
            treesitter = true,
            mason = true,
            cmp = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
            },
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
