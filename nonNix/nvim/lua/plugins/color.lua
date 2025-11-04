return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000, 
    config = function()
      require("catppuccin").setup({
       auto_integrations = false,
        transparent_background = true,
        integrations = {
          nvimtree = {
            enabled = true,
            transparent_panel = false,
          },
        },
      })
      vim.cmd([[colorscheme catppuccin-mocha]])
    end
  }
}
