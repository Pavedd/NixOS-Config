{
  flake.homeModules.git = { pkgs, config, ... }: { 
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Endersoul46";
          email = "paul.theodor.maier@gmail.com";
        };
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
      };
    };
  };
}
