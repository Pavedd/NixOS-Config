# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix
    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ./stylix.nix
    ./pkgs.nix
    ./drives.nix
    ./postgres.nix
    ./helix.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  
  # hostname
  networking.hostName = "astolfo";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ch";
    variant = "";
  };

  services.udisks2.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
   # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  services.pulseaudio = {
    enable = false;
  };
  hardware.bluetooth = { enable = true; };


  # Enable audio through pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
      starship init fish | source

      function cargo
        command cargo mommy $argv
      end
    '';
  };

  programs.zsh.enable = true;
 


  # Configure console keymap
  console.keyMap = "sg";



  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    # FIXME: Replace with your username
    es46 = {
      isNormalUser = true;
      description = "es46";
      #openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      #];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = ["wheel" "networkmanager"];
      shell = pkgs.fish;
      packages = with pkgs; [];
    };
  };

 
  environment.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    NH_FLAKE = "/etc/nixos";
    TERM = "xterm-256color";    
    CARGO_MOMMYS_LITTLE = "boy/princess/pet";
    CARGO_MOMMYS_MOODS = "chill/thirsty";
  };

  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
   fonts.fontDir.enable = true;

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];


  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  #services.openssh = {
    #enable = true;
    #settings = {
      # Opinionated: forbid root login through SSH.
      #PermitRootLogin = "no";
      # Opinionated: use keys only.
      # Remove if you want to SSH using passwords
      #PasswordAuthentication = false;
    #};
  #};

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
