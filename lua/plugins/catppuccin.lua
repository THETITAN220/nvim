return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = "mocha",
        transparent_background = true,
        no_italic = true,
        no_bold = true,
        integrations = {
            lualine = true,
            treesitter = true,
            mason = true,
            cmp = true,
            telescope = {
                enabled = true,
            },
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
        custom_highlights = function(colors)
            return {
                NormalFloat = { bg = "none" },
                FloatBorder = { bg = "none" },
                TelescopeNormal = { bg = "none" },
                TelescopeBorder = { bg = "none" },
                TelescopePromptNormal = { bg = "none" },
                TelescopePromptBorder = { bg = "none" },
                TelescopeResultsNormal = { bg = "none" },
                TelescopeResultsBorder = { bg = "none" },
                TelescopePreviewNormal = { bg = "none" },
                TelescopePreviewBorder = { bg = "none" },
            }
        end,
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
