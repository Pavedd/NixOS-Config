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
        self.homeModules.es46
        inputs.stylix.homeModules.stylix
      ];
    };

    flake.homeModules.es46 = {pkgs, config, ...}: {

    imports = [
        self.homeModules.pkgs
        self.homeModules.git
        self.homeModules.niri
        self.homeModules.hypridle
        self.homeModules.hyprlock
        self.homeModules.hyprpkgs
        self.homeModules.kitty
        self.homeModules.fuzzel
        self.homeModules.swaync
        self.homeModules.waybar
        self.homeModules.gtk

        self.homeModules.stylix
        self.homeModules.nvim
        self.homeModules.lazygit
        self.homeModules.starship
        self.homeModules.tmux
        self.homeModules.obsidian
        self.homeModules.vscode

        self.homeModules.mpd

    ];

      nixpkgs = {
        overlays = [ self.overlays.unstable ];
        config = {
        allowUnfree = true;
      };
    };


      stylix.targets = {
        swaync.enable = false;
        fuzzel.enable = false;
        neovim.enable = false;
        kitty.enable = false;
        waybar.enable = false;
        tmux.enable = false;
        starship.enable = false;
      };


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
      DIRENV_WARN_TIMEOUT="500";
    };

    fonts.fontconfig.enable = true;

    programs.home-manager.enable = true;

# Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "24.11";
  };
}
