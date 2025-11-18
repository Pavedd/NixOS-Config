{inputs, ... }: {
  flake.overlays.unstable = final: prev: {
    fenix = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
