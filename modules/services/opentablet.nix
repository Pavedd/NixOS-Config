{
  flake.nixosModules.opentablet = {lib, config, pkgs, ... }:
  {
    hardware.opentabletdriver.enable = true;
  };
}
