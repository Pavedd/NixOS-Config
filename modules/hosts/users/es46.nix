  {
    inputs,
    self,
    ...
  }: { 
    flake.nixosModules.es46 = { config, pkgs, ... }: {
      users.users = {
        es46 = {
          isNormalUser = true;
          description = "es46";

          extraGroups = ["wheel" "networkmanager" "dialout" "seat" "adbusers"];
          packages = with pkgs; [];
          shell = pkgs.fish;
        };
      };
    };

    flake.homeConfigurations.es46 = inputs.home-manager.lib.homeManagerConfiguration  {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        self.nixosModules.es46Home
        inputs.stylix.homeModules.stylix
      ];
    };

    flake.nixosModules.es46Home = {pkgs, config, ...}: {

    imports = [
      self.nixosModules.homePkgs
        self.nixosModules.git
        self.nixosModules.niri
        self.nixosModules.hypridle
        self.nixosModules.hyprlock
        self.nixosModules.hyprpkgs
        self.nixosModules.kitty
        self.nixosModules.swaync
        self.nixosModules.waybar
        self.nixosModules.gtk

        self.homeModules.stylix
        self.nixosModules.nvim
        self.nixosModules.lazygit
        self.nixosModules.starship
        self.nixosModules.tmux
        self.nixosModules.obsidian
        self.nixosModules.vscode

        self.nixosModules.mpd
    ];

      nixpkgs = {
        overlays = [ self.overlays.unstable ];
        config = {
        allowUnfree = true;
      };
    };

programs.fuzzel.enable = true;

    obsidian.sync.enable = true;

    home = {
      username = "es46";
      homeDirectory = "/home/es46";
    };


    home.sessionVariables = {
      WLR_DRM_DEVICES= "/dev/dri/card1";
      CARGO_MOMMYS_LITTLE = "boy/princess/pet";
      CARGO_MOMMYS_MOODS = "chill/thirsty";
      MOZ_ENABLE_WAYLAND=1;
    };

    fonts.fontconfig.enable = true;

    programs.home-manager.enable = true;

# Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "24.11";
  };
}
