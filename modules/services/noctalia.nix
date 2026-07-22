{inputs, ...}:{
  flake.nixosModules.noctalia = { pkgs, config, ... }: {
#    services.noctalia-shell.enable = true;
    environment.systemPackages = [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
#    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}
