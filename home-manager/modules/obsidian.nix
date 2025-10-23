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
        devices = {
          "Felix" = {
            id = "MDFFQ2B-ZO6L3SH-WBT75BZ-43DWXC5-IM35TIB-TYP3LOK-WEHFWA7-VCFHQQN";
            label = "Felix";
            autoAcceptFolders = true;
          };
          "ipad" = {
            id = "AOC56N3-O5D3HO6-GHYEY3A-YF7Q7UF-XSBDPZ4-T2X3KC6-ZEW5CDO-7N2V5QX";
            label = "ipad";
            autoAcceptFolders = true;
          };
          "kevin-klein" = {
            id = "ENG2J7H-OAHCO3V-DHUSV4T-FUAA6EW-NBMSG7C-YSMWFHX-TAQ5ANJ-YNDCEAR";
            label = "kevin-klein";
            autoAcceptFolders = true;
          };
        };
        folders."stuff" = {
          label = "stuff";
          id = "stuff";
          path = "/home/es46/Documents/stuff";
          devices = ["Felix" "ipad" "kevin-klein"];
        };
      };
    };
  };
 }
