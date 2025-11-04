  {
    inputs,
    self,
    ...
  }: { 

    flake.nixosModules.home = {pkgs, config, ...}: {

    imports = [
      self.nixosModules.homePkgs
        self.nixosModules.git
        self.nixosModules.hyprland
        self.nixosModules.hypridle
        self.nixosModules.hyprlock
        self.nixosModules.hyprpkgs
        self.nixosModules.kitty
        self.nixosModules.swaync
        self.nixosModules.waybar

        self.nixosModules.nvim
        self.nixosModules.lazygit
        self.nixosModules.starship
        self.nixosModules.tmux
        self.nixosModules.obsidian
        self.nixosModules.vscode

  #      self.nixosModules.stylix
        self.nixosModules.mpd
    ];


    nixpkgs = {

        config = {
        allowUnfree = true;
      };
    };


  #  obsidian.sync.enable = true;

    home = {
      username = "es46";
      homeDirectory = "/home/es46";
    };


    home.sessionVariables = {
      CARGO_MOMMYS_LITTLE = "boy/princess/pet";
      CARGO_MOMMYS_MOODS = "chill/thirsty";

    };

    fonts.fontconfig.enable = true;

    programs.home-manager.enable = true;

# Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "24.11";
  };
}
