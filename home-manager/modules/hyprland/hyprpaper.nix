{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = false;
    settings = {
      preload = [
        "/etc/nixos/home-manager/wallpapers/hollow.jpg"
        "/etc/nixos/home-manager/wallpapers/edgy_ahh_astolfo.jpg"
	"/etc/nixos/home-manager/wallpapers/marine-tunnel.jpg"
      ];
      wallpaper = [
        "eDP-1, /etc/nixos/home-manager/wallpapers/hollow.jpg"
      ];
    };
  };
}
