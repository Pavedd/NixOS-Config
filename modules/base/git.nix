{
  flake.nixosModules.git = { pkgs, config, ... }: { 
    programs.git = {
      enable = true;
      userName = "Endersoul46";
      userEmail = "paul.theodor.maier@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
      };
    };
  };
}
