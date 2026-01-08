{
  inputs,
    self,
    ...
}: { flake.nixosModules.defaultConf = { config, pkgs, ... }: {

  imports = [
      self.nixosModules.stylix
      self.nixosModules.base
      self.nixosModules.postgres
      self.nixosModules.fish
      self.nixosModules.pkgs
      self.nixosModules.nix-ld
      self.nixosModules.es46
  ];

  networking.hostName = self.host; 

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
    overlays = [ 
      self.overlays.unstable 
      inputs.en.overlays.default
      inputs.fenix.overlays.default
    ];
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
