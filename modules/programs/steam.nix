{
  flake.nixosModules.steam = {pkgs, config,   ...}: {
    hardware.steam-hardware.enable = true;

    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;

# enviroment.systemPackages = with pkgs; [
#   protonup
# ];
#
# enviroment.sessionVariables = {
#
#
# };

  };
}
