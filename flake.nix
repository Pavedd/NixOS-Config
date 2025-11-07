{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # nixpkgs-unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # flake parts
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    #hyprland.url = "github:hyprwm/Hyprland/9958d297641b5c84dcff93f9039d80a5ad37ab00"; hyprland v 0.49
    hyprland.url = "github:hyprwm/Hyprland"; 
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix";

 };
  outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);


}
