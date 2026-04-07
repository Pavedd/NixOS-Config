{
  flake.nixosModules.rocm = { pkgs, config, ... }: {
    environment.systemPackages = with pkgs; [
      rocmPackages.rocm-smi
      radeontop
    ];
  };
}
