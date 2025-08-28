{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprland
    xwayland
    hyprpaper
    hyprshot
    hyprlock
    hypridle
    tofi
    swaynotificationcenter
    swww
  ];
}
