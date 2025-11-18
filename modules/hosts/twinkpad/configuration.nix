 
{
  inputs,
  self,
  ...
}: {
  

  flake.nixosConfigurations.twinkpad = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.twinkpad-hardware
      self.nixosModules.defaultConf
      self.nixosModules.twinkpad
      inputs.stylix.nixosModules.stylix
      inputs.milk-grub-theme.nixosModule
    ];
  };




 flake.nixosModules.twinkpad = {
  config,
  pkgs,
  ...
}: {

 imports = [
   self.nixosModules.drives
];


# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
};
}
