{ inputs, ... }: {

# Configure Stylix
  flake.nixosModules.stylix = { pkgs, lib, config, ... }: {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = {
        base00 = "1e1e2e";  # Base
          base01 = "181825";  # Mantle
          base02 = "313244";  # Surface0
          base03 = "45475a";  # Surface1
          base04 = "585b70";  # Surface2
          base05 = "cdd6f4";  # Text
          base06 = "f5e0dc";  # Rosewater
          base07 = "b4befe";  # Lavender
          base08 = "f38ba8";  # Red
          base09 = "fab387";  # Peach
          base0A = "f9e2af";  # Yellow
          base0B = "a6e3a1";  # Green
          base0C = "94e2d5";  # Teal
          base0D = "89b4fa";  # Blue
          base0E = "cba6f7";  # Mauve (Accent)
          base0F = "f2cdcd";  # Flamingo
      };
    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };    

    cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };
       polarity = "dark";

   };
  }; 
                                   }


