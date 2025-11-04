
{ inputs , ... }: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = { config, pkgs, final, ... }: {
    overlayAttrs = {
      unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
     };
     pkgs.unstable = unstable;
  };
};
}
