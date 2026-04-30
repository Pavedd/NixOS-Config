 local M = {}

 function M.setup()
   -- local p = require('mini.base16').mini_palette('{{colors.surface_container.default.hex}}', '{{colors.primary.default.hex}}', 50)
   require('mini.base16').setup {
     -- palette = p,

     palette = {
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
     },
     use_cterm = false,
     plugins = {default = true}
   }

   vim.api.nvim_set_hl(0, "Normal",       { bg = "none" })
   vim.api.nvim_set_hl(0, "NormalNC",     { bg = "none" }) -- inactive splits
   vim.api.nvim_set_hl(0, "NormalSB",     { bg = "none" }) -- inactive splits


  vim.api.nvim_set_hl(0, "LineNr",        { fg = '{{colors.outline.default.hex}}', bg = "none" })
  vim.api.nvim_set_hl(0, "LineNrAbove",  { fg = '{{colors.outline.default.hex}}', bg = "{{colors.surface_container_low.default.hex}}" })
  vim.api.nvim_set_hl(0, "LineNrBelow",  { fg = '{{colors.outline.default.hex}}', bg = "{{colors.surface_container_low.default.hex}}" })
 

 -- Sign column (CRITICAL)
  vim.api.nvim_set_hl(0, "SignColumn",   { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumnSB", { bg = "none" })

  -- Folds / columns (typo fixed)
  vim.api.nvim_set_hl(0, "FoldColumn",  { bg = "none" })
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })

  -- Diagnostics (signs inherit transparency only if these are bg=nil)
  vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn",  { bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo",  { bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingHint",  { bg = "none" })

  -- Floats (intentionally NOT transparent — feel free to set none)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "{{colors.surface_container.default.hex}}" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "{{colors.surface_container.default.hex}}" })
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
