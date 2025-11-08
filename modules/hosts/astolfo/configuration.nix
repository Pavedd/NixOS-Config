 
{
  inputs,
  self,
  ...
}: { 

  flake.nixosConfigurations.astolfo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.astolfo-hardware
      self.nixosModules.astolfo
    ];
  };


  flake.nixosModules.astolfo = {
  config,
  pkgs,
  ...
  }: {

  imports = [
    #Sets the Hostname
    self.nixosModules.current

    self.nixosModules.base
    self.nixosModules.steam
    self.nixosModules.vr
    self.nixosModules.nvidia
    self.nixosModules.postgres
    self.nixosModules.fish
    self.nixosModules.pkgs
    self.nixosModules.es46
 ];

  programs.niri.enable = true;

  nixpkgs = {
    overlays = [ self.overlays.unstable ];
    config = {
      allowUnfree = true;
    };
  };

  nix = let
#    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
      settings = {
        experimental-features = "nix-command flakes";
# Opinionated: disable global registry
#      flake-registry = "";
# Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
        trusted-users = [ "root" "@wheel" ];
      };
# Opinionated: disable channels
      channel.enable = false;

# Opinionated: make flake registry and nix path match flake inputs
# registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
# nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };







# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
};
}
