{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "/etc/nixos/home-manager/wallpapers/edgy_ahh_astolfo.jpg"
      ];
      wallpaper = [
        ", /etc/nixos/home-manager/wallpapers/edgy_ahh_astolfo.jpg"
      ];
    };
  };
}
