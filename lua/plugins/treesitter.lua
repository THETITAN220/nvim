return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        event = "BufRead",
        branch = "main",
        build = ":TSUpdate",
        ---@class TSConfig
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "css",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "graphql",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "json5",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
        },
        config = function(_, opts)
            if opts.ensure_installed and #opts.ensure_installed > 0 then
                require("nvim-treesitter").install(opts.ensure_installed)
                for _, parser in ipairs(opts.ensure_installed) do
                    local filetypes = parser -- In this case, parser is the filetype/language name
                    vim.treesitter.language.register(parser, filetypes)

                    vim.api.nvim_create_autocmd({ "FileType" }, {
                        pattern = filetypes,
                        callback = function(event)
                            vim.treesitter.start(event.buf, parser)
                        end,
                    })
                end
            end

            vim.api.nvim_create_autocmd({ "BufRead" }, {
                callback = function(event)
                    local bufnr = event.buf
                    local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

                    if filetype == "" then
                        return
                    end

                    for _, filetypes in pairs(opts.ensure_installed) do
                        local ft_table = type(filetypes) == "table" and filetypes or { filetypes }
                        if vim.tbl_contains(ft_table, filetype) then
                            return -- Already handled above
                        end
                    end

                    local parser_name = vim.treesitter.language.get_lang(filetype) -- might return filetype (not helpful)
                    if not parser_name then
                        return
                    end
                    local parser_configs = require("nvim-treesitter.parsers")
                    if not parser_configs[parser_name] then
                        return -- Parser not available, skip silently
                    end

                    local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if not parser_installed then
                        require("nvim-treesitter").install({ parser_name }):wait(30000)
                    end

                    parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

                    if parser_installed then
                        vim.treesitter.start(bufnr, parser_name)
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufRead",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
        },
        opts = {
            multiwindow = true,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        keys = {
            {
                "af",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
                end,
                desc = "Select outer function",
                mode = { "x", "o" },
            },
            {
                "if",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
                end,
                desc = "Select inner function",
                mode = { "x", "o" },
            },
            {
                "ac",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
                end,
                desc = "Select outer class",
                mode = { "x", "o" },
            },
            {
                "ic",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
                end,
                desc = "Select inner class",
                mode = { "x", "o" },
            },
            {
                "as",
                function()
                    require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
                end,
                desc = "Select local scope",
                mode = { "x", "o" },
            },
        },
        ---@module "nvim-treesitter-textobjects"
        opts = { multiwindow = true },
    },
}
