return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      autoformat = true,
      format_notify = false,
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },
}
