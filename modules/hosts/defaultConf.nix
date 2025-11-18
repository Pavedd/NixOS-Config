{
  inputs,
    self,
    ...
}: { flake.nixosModules.defaultConf = { config, pkgs, ... }: {

  imports = [
#Sets the Hostname
    self.nixosModules.current

      self.nixosModules.stylix
      self.nixosModules.base
      self.nixosModules.postgres
      self.nixosModules.fish
      self.nixosModules.pkgs
      self.nixosModules.es46
  ];

  stylix.targets = {
    gnome.enable = true; 
    gtk.enable = true;
    qt.enable = true;
    grub.enable = false;
    fish.enable = false;
  };

  programs.niri.enable = true; 
  qt.enable = true;

  nixpkgs = {
    overlays = [ self.overlays.unstable ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      nix-path = config.nix.nixPath;
      trusted-users = [ "root" "@wheel" ];
    };

    channel.enable = false;
  };
};
} 
