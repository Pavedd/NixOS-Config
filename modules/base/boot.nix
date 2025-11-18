{
 flake.nixosModules.base = { config, pkgs, ... }: {
    boot.loader.systemd-boot.enable = false;
    boot.loader.grub = {
      enable = true;
      milk-theme.enable = true;   
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
    boot.loader.efi.canTouchEfiVariables = true;
# boot.kernelPackages = pkgs.linuxPackagesFor (pkgs.linux_6_17.override {
#   argsOverride = rec {
#     src = pkgs.fetchurl {
#       url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
#       sha256 = "c05faf36e9c2164be723cf6ada8533788804d48f9dd2fe1be2ccee3616a92bce";
#     };
#     version = "6.17.5";
#     modDirVersion = "6.17.5";
#   };
# });
   };
}

