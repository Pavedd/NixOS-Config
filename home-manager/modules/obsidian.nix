{lib, config, pkgs,  ...}:

with lib;

{
  options.obsidian.sync.enable = mkOption{
    type = types.bool;
    default = false;
    description = "Enable syncing for Obsidian via Syncthing.";
  };
  config = mkIf config.obsidian.sync.enable{
    home.packages = with pkgs; [ 
      obsidian
    ];

    services.syncthing = {
      enable = true;
      settings = {
        folders."stuff" = {
          label = "stuff";
          id = "stuff";
          path = "/home/es46/Documents/stuff";
        };
      };
    };
  };
 }
