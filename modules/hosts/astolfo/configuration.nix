 
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
      self.nixosModules.amd
      self.nixosModules.rocm
      self.nixosModules.ollama
      self.nixosModules.docker
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
];



# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
};
}
