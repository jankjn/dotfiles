return {
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function(_, opts)
      opts.indent = {}
    end,
  },
}
