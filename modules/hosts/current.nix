{
  inputs,
  self,
  pkgs,
  ...
}: {
  flake.nixosConfigurations.astolfo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.PC
    ];
  };


  flake.homeConfigurations."es46@astolfo" = inputs.home-manager.lib.homeManagerConfiguration  {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        self.nixosModules.home
      ];
  };
}
