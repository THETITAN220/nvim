return {

    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        local autopairs = require("nvim-autopairs")

        autopairs.setup({
            check_ts = true,  -- Enable Treesitter integration
            ts_config = {
                lua = { "string" }, -- Don't add pairs in lua string treesitter nodes
                javascript = { "template_string" },
            },
        })

        -- Integration with nvim-cmp
        -- This makes it so that if you complete a function via cmp,
        -- it automatically adds the parentheses.
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
