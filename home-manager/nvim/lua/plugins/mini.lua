local astolfo =[[
                                                                    
                      ▓▓▓████▓▓▓▓                                   
                  █████▓▓▓█▓▓▓████▓                                 
                 ████▒▒▒▒▓▓▓▓▒▒▒▒██                                 
                 ██▓▒▒▓▓▓▓███▓▓▒▒▒█                                 
              ▓███▓████████████████████                             
           ▒█████▓█████████████████▓███████                         
          ▓██████▓███████████████████▓█████▒▒                       
         ███████▓██▓▓████████▓███▓▓███▓███████                      
       ▒████████▓██▓▓█▓▓████▓██▓▓█▓███▓████████                     
         ██████▓▒▓▓  ▓▓▓▓███▓▓▓▓▓▓ ▓▓▓▒███████                      
         ██████▓▒▒     ▓▓██▓▓█       ▒▒███████                      
         █▓▓█▓█▓▒ ▓██▓ ▒▓▓███▓█▒▒ █▓▒ ▒████▓▓█       {Hey Master!}  
           ▒██▓▓▓▒███▓▓███▓████▒▓▓███▒▓▓███         /               
       ▒█    █▓▓▓▓███████████████████▓▓▓██                          
   ▓█  ▒█    ▒▓▓▓▓▓███████████████▓▓▓▓▓▓▓▒                          
   ▒██▒▒██   ▒▒▓▓▓▒████▒▒▒▒██▒█████▒▓▓▓▒▒▒                          
     ▒████▓▓  ▒▓▒██▒▒▓███▓▓▓▓▓███▓▒███▒▒▒                           
     ████████     █▒ ▒▒████████▒▒▒▒█▓                               
     ████████▓ ▒▒▓▓▒ ▒  ▒██████  ▒▒ ▒▓▓▒                            
      ████████  ▓▓▓▓▓▓ ████████  ▓▓▓▓▓▓▓  ▓                         
         ████    ▓▓▓▒██▒▒█████ ████▒▓▓  ▒▓▓▓▒                       
              ▓▓▓ ▓   ▓▓▓ ███ ▓▓▓▓  ▒▓▓ ▒▓▓▓▓▒                      
       ▒▓▓▓▓▓▓▓▓▓ ▓▓▓ ▓▓▓▓   ▓▓▓▓▓ ▓▓▓▓ ▒▓▓▓▓▒                      
         ▒▒▒▒▒▒▒▒  ▒▒ ████████████ ▒▒▒  ▒▒▒▒▒▒                      
]]
return {
  {
    'nvim-mini/mini.nvim',
    version = false,
    config = function ()
      vim.keymap.set('n', 's', '<Nop>', { noremap = true })
      require("mini.extra").setup()
      require("mini.icons").setup()
      require("mini.files").setup()
      require("mini.notify").setup()
      local starter = require("mini.starter")
      starter.setup( {header = astolfo, footer = "",
      items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(5),
        {name = "", action = ":lua MiniFiles.open()", section = "Recent files"},
      },
      content_hooks = {
        starter.gen_hook.adding_bullet("➤ "),
        starter.gen_hook.aligning("center", "center"),
      }
    } )

    require("mini.indentscope").setup({
      draw = {
        animation = function()
          return 1
        end,
      },
      symbol = "│",
    })
    require("mini.git").setup()
    


     require("mini.statusline").setup({
       content = {
         active = function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
           local git           = MiniStatusline.section_git({ trunc_width = 40 })
           local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
           local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
           local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
           local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 40, icon = ""})
    
           return MiniStatusline.combine_groups({
             { hl = mode_hl,                 strings = { mode } },
             { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
             '%<', -- Mark general truncate point
             { hl = 'MiniStatuslineFilename', strings = { filename } },
             '%=', -- End left alignment
             { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
             { hl = mode_hl,                  strings = { search } },
           })
         end,
         inactive = nil,
       },
       use_icons = true;
     })
     require("mini.surround").setup({ mappings = { add = 's'}})
    require("mini.comment").setup({ mappings = { comment = 'sc', comment_line = 'scc', comment_visual = 'sc', textobject = 'sc' } })
    require("mini.splitjoin").setup({ mappings = { toggle = 'sS'} })

    vim.keymap.set("n", "<leader>e", function ()
      MiniFiles.open()
    end) 
  end
}
}
