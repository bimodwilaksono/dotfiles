return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
    }
    return opts
  end,
}
