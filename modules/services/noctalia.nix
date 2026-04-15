{
  flake.nixosModules.noctalia = { pkgs, config, ... }: {
    services.noctalia-shell.enable = true;
#    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
