{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprland
    xwayland
    hyprpaper
    hyprshot
    tofi
    swaynotificationcenter
  ];
}
