
return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000, 
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          all = {
            -- 🌸 Accents: High-vibrancy Primary roles (Main Identifiers)
            rosewater = "{{colors.primary_fixed.default.hex}}",
            flamingo  = "{{colors.primary.default.hex}}",
            pink      = "{{colors.primary_fixed_dim.default.hex}}",
            mauve     = "{{colors.primary.default.hex}}", -- Vibrant Functions

            -- 🛑 Errors: Pure Error role
            red       = "{{colors.error.default.hex}}",
            maroon    = "{{colors.error.default.hex}}", -- Pushing red for consistency

            -- 🎨 Tertiary: The "Pop" colors (Strings/Constants)
            peach     = "{{colors.tertiary.default.hex}}",       -- Bright Constants
            yellow    = "{{colors.tertiary_fixed.default.hex}}", -- Bright Warning/Yellow
            green     = "{{colors.tertiary_fixed_dim.default.hex}}", -- Vibrant Strings

            -- 💎 Secondary: High-Contrast Logic (Keywords/Regex)
            teal      = "{{colors.secondary_fixed.default.hex}}", 
            sky       = "{{colors.secondary.default.hex}}",
            sapphire  = "{{colors.secondary_fixed_dim.default.hex}}",
            blue      = "{{colors.secondary.default.hex}}",      -- Vibrant Logic
            lavender  = "{{colors.secondary_fixed.default.hex}}",-- Vibrant Keywords

            -- 📝 Text system (Pure On-Surface for maximum legibility)
            text      = "{{colors.on_surface.default.hex}}",
            subtext1  = "{{colors.on_surface_variant.default.hex}}",
            subtext0  = "{{colors.outline.default.hex}}",

            -- 🧱 Overlays / UI Lines
            overlay2  = "{{colors.outline.default.hex}}",
            overlay1  = "{{colors.outline_variant.default.hex}}",
            overlay0  = "{{colors.surface_variant.default.hex}}",

            -- 🧩 Surface elevation system (Using non-container surfaces where possible)
            surface2  = "{{colors.surface_container_high.default.hex}}",
            surface1  = "{{colors.surface_container.default.hex}}",
            surface0  = "{{colors.surface_container_low.default.hex}}",

            -- 🌑 Base background stack
            base      = "{{colors.surface.default.hex}}",
            mantle    = "{{colors.surface_dim.default.hex}}",
            crust     = "{{colors.surface_bright.default.hex}}",
          },
        },
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

