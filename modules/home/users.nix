{
  flake.nixosModules.users = { config, pkgs, ... }: {
    users.users = {
      es46 = {
        isNormalUser = true;
        description = "es46";

       extraGroups = ["wheel" "networkmanager" "dialout"];
        packages = with pkgs; [];
        shell = pkgs.fish;
      };
    };
  };
}


