{
  flake.nixosModules.gtk = { pkgs, config, ... }: {
    xdg.enable = true;
    gtk = {
      enable = true;
    };
    qt = {
      enable = true;
    };
  };
}
