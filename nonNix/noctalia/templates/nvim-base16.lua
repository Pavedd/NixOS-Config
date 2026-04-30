 local M = {}

 function M.setup()
   require('base16-colorscheme').setup {
       -- Background tones
       base00 = '{{colors.surface_variant.default.hex}}', -- Default Background
       base01 = '{{colors.surface_container.default.hex}}', -- Lighter Background (status bars)
       base02 = '{{colors.surface_container_high.default.hex}}', -- Selection Background
       base03 = '{{colors.outline.default.hex}}', -- Comments, Invisibles
       -- Foreground tones
       base04 = '{{colors.on_surface_variant.default.hex}}', -- Dark Foreground (status bars)
       base05 = '{{colors.on_surface.default.hex}}', -- Default Foreground
       base06 = '{{colors.on_surface.default.hex}}', -- Light Foreground
       base07 = '{{colors.on_background.default.hex}}', -- Lightest Foreground
       -- Accent colors
       base08 = '{{colors.error.default.hex}}', -- Variables, XML Tags, Errors
       base09 = '{{colors.tertiary.default.hex}}', -- Integers, Constants
       base0A = '{{colors.secondary.default.hex}}', -- Classes, Search Background
       base0B = '{{colors.primary.default.hex}}', -- Strings, Diff Inserted
       base0C = '{{colors.tertiary_fixed_dim.default.hex}}', -- Regex, Escape Chars
       base0D = '{{colors.primary_fixed_dim.default.hex}}', -- Functions, Methods
       base0E = '{{colors.secondary_fixed_dim.default.hex}}', -- Keywords, Storage
       base0F = '{{colors.primary_fixed.default.hex}}', -- Deprecated, Embedded Tags
   }

   vim.api.nvim_set_hl(0, "Normal",       { bg = nil })
   vim.api.nvim_set_hl(0, "NormalNC",     { bg = nil }) -- inactive splits
   vim.api.nvim_set_hl(0, "NormalSB",     { bg = nil }) -- inactive splits


  vim.api.nvim_set_hl(0, "LineNr",        { fg = '{{colors.outline.default.hex}}', bg = nil })
  vim.api.nvim_set_hl(0, "LineNrAbove",  { fg = '{{colors.outline.default.hex}}', bg = "{{colors.surface_container_low.default.hex}}" })
  vim.api.nvim_set_hl(0, "LineNrBelow",  { fg = '{{colors.outline.default.hex}}', bg = "{{colors.surface_container_low.default.hex}}" })
 

   -- Folds / columns (typo fixed)
  vim.api.nvim_set_hl(0, "FoldColumn",  { bg = nil })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = nil })

  -- Floats (intentionally NOT transparent — feel free to set none)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "{{colors.surface_container.default.hex}}" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "{{colors.surface_container.default.hex}}" })


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
