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
      "python",
      "json",
      "html",
      "css",
      "go",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

