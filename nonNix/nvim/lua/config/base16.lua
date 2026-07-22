 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
       -- Background tones
       base00 = '#2e2230', -- Default Background
       base01 = '#392a3c', -- Lighter Background (status bars)
       base02 = '#332636', -- Selection Background
       base03 = '#736176', -- Comments, Invisibles
       -- Foreground tones
       base04 = '#b5afb6', -- Dark Foreground (status bars)
       base05 = '#f3f2f3', -- Default Foreground
       base06 = '#f3f2f3', -- Light Foreground
       base07 = '#f3f2f3', -- Lightest Foreground
       -- Accent colors
       base08 = '#fd4663', -- Variables, XML Tags, Errors
       base09 = '#cc6676', -- Integers, Constants
       base0A = '#d65cab', -- Classes, Search Background
       base0B = '#d167e4', -- Strings, Diff Inserted
       base0C = '#e996a3', -- Regex, Escape Chars
       base0D = '#de93ec', -- Functions, Methods
       base0E = '#e996cb', -- Keywords, Storage
       base0F = '#ebbef4', -- Deprecated, Embedded Tags
   }

   vim.api.nvim_set_hl(0, "Normal",       { bg = nil })
   vim.api.nvim_set_hl(0, "NormalNC",     { bg = nil }) -- inactive splits
   vim.api.nvim_set_hl(0, "NormalSB",     { bg = nil }) -- inactive splits


  vim.api.nvim_set_hl(0, "LineNr",        { fg = '#736176', bg = nil })
  vim.api.nvim_set_hl(0, "LineNrAbove",  { fg = '#736176', bg = "#1d151e" })
  vim.api.nvim_set_hl(0, "LineNrBelow",  { fg = '#736176', bg = "#1d151e" })
 

   -- Folds / columns (typo fixed)
  vim.api.nvim_set_hl(0, "FoldColumn",  { bg = nil })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = nil })

  -- Floats (intentionally NOT transparent — feel free to set none)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#392a3c" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#392a3c" })


 -- Sign column (CRITICAL)
  vim.api.nvim_set_hl(0, "SignColumn",   { bg = nil })
  vim.api.nvim_set_hl(0, "SignColumnSB", { bg = nil })


  -- Diagnostics (signs inherit transparency only if these are bg=nil)
  vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = nil })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn",  { bg = nil })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo",  { bg = nil })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingHint",  { bg = nil })

end


 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['config.base16'] = nil
     require('config.base16').setup()
   end)
 )

 return M
