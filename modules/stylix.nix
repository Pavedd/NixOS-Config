{ self, ... }:

let
  # Define the module once so both HM and NixOS can use it
  stylixModule = { pkgs, ... }: {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = self.themeNoHash;
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
in {
  flake = {
    nixosModules.stylix = stylixModule;
    homeModules.stylix = stylixModule;
  };
}

