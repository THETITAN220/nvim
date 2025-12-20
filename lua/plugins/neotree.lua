return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- optional but recommended for icons
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree Toggle" },
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true, -- Show hidden files by default
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            follow_current_file = {
                enabled = true, -- Focus the file you are currently editing
            },
        },
        window = {
            width = 30,
            mappings = {
                ["<space>"] = "none", -- Disable space to avoid conflicts with leader
            },
        },
    }
}
