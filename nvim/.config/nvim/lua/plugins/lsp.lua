return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      autoformat = true,
      format_notify = false,
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = true,
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4", "-ci", "-s" } }),
        },
      }
    end,
  },
}
