{ ... }:
{
  imports = [
    ./pkgs.nix
    ./hyprland/default.nix
    ./cmd/default.nix
    ./shell.nix
    ./obsidian.nix
    ./mpd.nix
  ];
}
