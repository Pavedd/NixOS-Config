{ ... }:
{
  imports = [
    ./pkgs.nix
    ./hyprland/default.nix
    ./nvim/nvim.nix
    ./kitty.nix
    ./starship.nix
    ./tmux.nix
  ];
}
