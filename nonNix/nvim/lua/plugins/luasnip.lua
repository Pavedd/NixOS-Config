
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function ()
    local ls = require("luasnip")

    ls.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })

    vim.keymap.set({ "i", "s" }, "<M-l>", function()
      ls.expand_or_jump()
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<M-h>", function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<M-j>", function()
      ls.change_choice(1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<M-k>", function()
      ls.change_choice(-1)
    end, { silent = true })


    require("luasnip.loaders.from_vscode").lazy_load()
  end
}

