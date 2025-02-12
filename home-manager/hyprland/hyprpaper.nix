{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "./etc/nixos/home-manager/wallpapers/astolfo_cool.jpg"
      ];
      wallpaper = [
        "monitor, ./etc/nixos/home-manager/wallpapers/astolfo_classic.jpg"
      ];
    };
  };
}
