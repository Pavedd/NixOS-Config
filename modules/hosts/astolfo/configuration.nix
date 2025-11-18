 
{
  inputs,
  self,
  ...
}: { 

  flake.nixosConfigurations.astolfo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.astolfo-hardware
      self.nixosModules.defaultConf
      self.nixosModules.astolfo
      inputs.stylix.nixosModules.stylix
      inputs.milk-grub-theme.nixosModule
    ];
  };


  flake.nixosModules.astolfo = {
  config,
  pkgs,
  ...
  }: {

  imports = [
    self.nixosModules.steam
#    self.nixosModules.vr
    self.nixosModules.nvidia
];



# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
};
}
