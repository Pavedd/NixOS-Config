{ ... }:
{
  imports = [
    ./pkgs.nix
    ./hyprland/default.nix
    ./steam.nix
    ./cmd/default.nix
    ./shell.nix
    ./obsidian.nix
    ./mpd.nix
  ];
}
