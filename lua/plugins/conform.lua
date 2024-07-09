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
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    }),
}
