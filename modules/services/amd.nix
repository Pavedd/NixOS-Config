{
  flake.nixosModules.amd = 
  {
    config,
    lib,
    pkgs,
    ...
  }:
  {
    environment.variables = {
      RUSTICL_ENABLE = "radeonsi";
    };
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        mesa.opencl # Enables Rusticl (OpenCL) support
      ];
    };
  };
}
