return {
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "autopep8" },
      -- Use a sub-list to run only the first available formatter
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }),
}
