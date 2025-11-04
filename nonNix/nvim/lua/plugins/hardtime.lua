return {
   "m4xshen/hardtime.nvim",
   lazy = false,
   dependencies = { "MunifTanjim/nui.nvim" },
   config = function ()
     require("hardtime").setup()
     vim.keymap.set('n', '<leader>ht', ':Hardtime toggle<CR>', { noremap = true })
   end
}
