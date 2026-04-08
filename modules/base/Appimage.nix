{
  flake.nixosModules.appimage = { pkgs, config, ... }: {
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    environment.systemPackages = with pkgs; [
      appimage-run
    ];
  };
}
