return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- ✅ REQUIRED for cmp-nvim-lsp
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      --------------------------------------------------
      -- Diagnostics UI
      --------------------------------------------------
      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = "rounded", source = "always" },
      })

      --------------------------------------------------
      -- Mason
      --------------------------------------------------
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "pyright",
          "ts_ls",
          "gopls",
          "rust_analyzer",
        },
        automatic_installation = true,
      })

      --------------------------------------------------
      -- Capabilities (NEW API safe)
      --------------------------------------------------
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities(
          vim.lsp.protocol.make_client_capabilities()
        )

      --------------------------------------------------
      -- on_attach
      --------------------------------------------------
      local function on_attach(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end

        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
        map("n", "<leader>e", vim.diagnostic.open_float)
      end

      --------------------------------------------------
      -- NEW Neovim 0.11+ LSP API
      --------------------------------------------------
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("clangd", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("pyright", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("ts_ls", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("gopls", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("rust_analyzer", { capabilities = capabilities, on_attach = on_attach })

      --------------------------------------------------
      -- Enable servers
      --------------------------------------------------
      vim.lsp.enable({
        "lua_ls",
        "clangd",
        "pyright",
        "ts_ls",
        "gopls",
        "rust_analyzer",
      })
    end,
  },
}

